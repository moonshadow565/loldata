TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBGetChampionBySkinName,
    Params = {
      Skin = "Heimerdinger",
      Team = TEAM_UNKNOWN,
      TeamVar = "teamID",
      DestVar = "Attacker"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "Dmg"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "Dmg",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MaxHealth",
      Value2 = 500,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "UrAniumRoundsHit",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 50,
                  NumberStacks = 1,
                  Duration = 3,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MaxHealth",
          Value2 = 700,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
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
                      Range = 125,
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
                            Function = BBMath,
                            Params = {
                              Src2Var = "Dmg",
                              Src1Value = 0.4,
                              Src2Value = 0,
                              DestVar = "ThirdDA",
                              MathOp = MO_MULTIPLY
                            }
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "ThirdDA",
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimerdinger"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumroundshit"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tiamatmelee_itm.troy"
    }
  }
}
