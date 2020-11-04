ItemOnHitUnitBuildingBlocks = {
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "TiamatMelee_itm.troy",
              Flags = 0,
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Target",
              Range = 210,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Unit",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Owner",
                      Src2Var = "Target",
                      CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Owner", CompareOp = CO_IS_MELEE},
                        SubBlocks = {
                          {
                            Function = BBMath,
                            Params = {
                              Src2Var = "DamageAmount",
                              Src1Value = 0.5,
                              Src2Value = 0,
                              DestVar = "ThirdDA",
                              DestVarTable = "TempTable1",
                              MathOp = MO_MULTIPLY
                            }
                          }
                        }
                      },
                      {
                        Function = BBElse,
                        Params = {},
                        SubBlocks = {
                          {
                            Function = BBMath,
                            Params = {
                              Src2Var = "DamageAmount",
                              Src1Value = 0.35,
                              Src2Value = 0,
                              DestVar = "ThirdDA",
                              DestVarTable = "TempTable1",
                              MathOp = MO_MULTIPLY
                            }
                          }
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Owner",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "ThirdDA",
                          DamageVarTable = "TempTable1",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_DEFAULT,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          IgnoreDamageIncreaseMods = true,
                          IgnoreDamageCrit = true
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tiamatmelee_itm.troy"
    }
  }
}
