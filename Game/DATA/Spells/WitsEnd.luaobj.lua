BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBGetManaOrHealth,
                    Params = {
                      DestVar = "VictimMana",
                      OwnerVar = "Target",
                      Function = GetMana
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "VictimMana",
                      Src1Value = 0,
                      Src2Value = 42,
                      DestVar = "DamageDone",
                      MathOp = MO_MIN
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "DamageDone",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "ManaRemoved",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "DamageDone",
                      Value2 = 0,
                      CompareOp = CO_GREATER_THAN
                    },
                    SubBlocks = {
                      {
                        Function = BBIncMana,
                        Params = {
                          TargetVar = "Target",
                          Delta = 0,
                          DeltaVar = "ManaRemoved"
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          TargetVar = "Target",
                          Damage = 0,
                          DamageVar = "DamageDone",
                          DamageType = MAGIC_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_PROC,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
