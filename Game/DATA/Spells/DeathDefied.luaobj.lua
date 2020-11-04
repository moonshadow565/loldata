BuffTextureName = "Lich_Untransmutable.dds"
BuffName = "Death Defied"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentRespawnTimeMod,
      TargetVar = "Owner",
      Delta = 0.2
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurHealth",
          OwnerVar = "Owner",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurHealth",
          Src2Var = "DamageAmount",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Nothing",
              BuffName = "DeathDefiedBuff"
            },
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Nothing",
                  BuffName = "ChronoShift"
                },
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      CasterVar = "Nothing",
                      BuffName = "WillRevive"
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "CurHealth",
                          Src1Value = 0,
                          Src2Value = 1,
                          DestVar = "DamageAmount",
                          MathOp = MO_SUBTRACT
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Attacker",
                          BuffName = "DeathDefiedBuff",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 8,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "DeathDefiedSelf",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 8.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      }
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
                Function = BBMath,
                Params = {
                  Src1Var = "CurHealth",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
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
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "chronoshift"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "willrevive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedself"
    }
  }
}
