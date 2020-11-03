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
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "VictimMana",
                      OwnerVar = "Target",
                      Function = GetPAR,
                      PARType = PAR_MANA
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
                        Function = BBIncPAR,
                        Params = {
                          TargetVar = "Target",
                          Delta = 0,
                          PARType = PAR_MANA,
                          DeltaVar = "ManaRemoved"
                        }
                      },
                      {
                        Function = BBSetBuffCasterUnit,
                        Params = {CasterVar = "Caster"}
                      },
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
                        SubBlocks = {
                          {
                            Function = BBGetPetOwner,
                            Params = {PetVar = "Attacker", DestVar = "Caster"}
                          }
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Caster",
                          TargetVar = "Target",
                          Damage = 0,
                          DamageVar = "DamageDone",
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
              }
            }
          }
        }
      }
    }
  }
}
