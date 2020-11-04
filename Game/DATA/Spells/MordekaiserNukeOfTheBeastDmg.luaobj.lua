OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BaseDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Attacker",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "percentLeech",
      SrcValueByLevel = {
        0.25,
        0.25,
        0.25,
        0.25,
        0.25,
        0.25,
        0.275,
        0.275,
        0.275,
        0.275,
        0.275,
        0.275,
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
  }
}
