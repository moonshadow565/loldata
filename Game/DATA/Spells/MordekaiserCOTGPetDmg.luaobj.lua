OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Attacker",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBRequireVar,
        Params = {
          RequiredVar = "DamageToDeal",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Attacker",
          Damage = 0,
          DamageVar = "DamageToDeal",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_PROC,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
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
            Function = BBMath,
            Params = {
              Src2Var = "DamageAmount",
              Src1Value = 0.3,
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_AI},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "DamageAmount",
              Src1Value = 0.3,
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
              DestVar = "count",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          }
        }
      }
    }
  }
}
