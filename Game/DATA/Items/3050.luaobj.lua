BuffTextureName = "3050_Rallying_Banner.dds"
BuffName = "Stark's Fervor Aura"
AutoBuffActivateEffect = ""
UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.9,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = false
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LifeStealMod",
              DestVarTable = "NextBuffVars",
              SrcValue = 0.2
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = 0.2
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HealthRegenMod",
              DestVarTable = "NextBuffVars",
              SrcValue = 6
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1200,
              Flags = "AffectFriends AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Owner",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "RallyingBannerAuraSelf",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "RallyingBannerAuraFriend",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ArmorMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -20
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1200,
              Flags = "AffectEnemies AffectNeutral AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "RallyingBanner",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1,
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
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "RallyingBanner_itm.troy",
      Flags = 0,
      EffectIDVar = "StarkSelfParticle",
      EffectIDVarTable = "InstanceVars",
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
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_SAME_TEAM
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "RallyingBanner_itm.troy",
          Flags = 0,
          EffectIDVar = "StarkSelfParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "RallyingBanner_itm.troy",
          Flags = 0,
          EffectIDVar = "StarkSelfParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "StarkSelfParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rallyingbannerauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rallyingbanner"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rallyingbanner_itm.troy"
    }
  }
}
