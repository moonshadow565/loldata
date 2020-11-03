OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageToDeal",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoOnce",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Attacker",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoOnce",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = MAGIC_DAMAGE,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DoOnce",
          Src1VarTable = "InstanceVars",
          Value2 = false,
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
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "DamageAmount",
              HealerVar = "Owner"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DoOnce",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          }
        }
      }
    }
  }
}
