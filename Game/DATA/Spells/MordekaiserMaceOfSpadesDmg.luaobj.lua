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
          RequiredVar = "BaseDamage",
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
          DamageVar = "BaseDamage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
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
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "percentLeech",
          SrcValueByLevel = {
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35,
            0.35
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "percentLeech",
          SrcValueByLevel = {
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175,
            0.175
          }
        }
      }
    }
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
              DestVar = "count",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "percentLeech",
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
