BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
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
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "MaxHealth",
                      OwnerVar = "Target",
                      Function = GetMaxHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Target", DestVar = "TeamId"}
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "MaxHealth",
                      Src1Value = 0.04,
                      Src2Value = 0,
                      DestVar = "Damage",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "TeamId",
                      Value2 = TEAM_NEUTRAL,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src2Var = "Damage",
                          Src1Value = 120,
                          Src2Value = 0,
                          DestVar = "Damage",
                          MathOp = MO_MIN
                        }
                      }
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "Damage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_PROC,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
