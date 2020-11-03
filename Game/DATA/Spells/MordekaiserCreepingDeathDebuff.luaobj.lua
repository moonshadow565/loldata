BuffTextureName = "FallenAngel_TormentedSoil.dds"
BuffName = "MordekaiserCreepingDeathDebuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Attacker",
      Damage = 0,
      DamageVar = "DamagePerTick",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.2,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "percentLeech",
          SrcValueByLevel = {
            0.2,
            0.2,
            0.2,
            0.2,
            0.2,
            0.2,
            0.25,
            0.25,
            0.25,
            0.25,
            0.25,
            0.25,
            0.3,
            0.3,
            0.3,
            0.3,
            0.3,
            0.3
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentLeech",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ShieldAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_SHIELD,
          DeltaVar = "ShieldAmount"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Count",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      }
    }
  }
}
