AutoBuffActivateEffect = ""
AutoItemActivateEffect = ""
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MagicResistBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 15
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ArmorBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 12
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 8
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1200,
              Flags = "AffectFriends AffectMinions AffectHeroes ",
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
                      AttackerVar = "Attacker",
                      BuffName = "AegisoftheLegionAuraSelf",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1.2,
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
                      AttackerVar = "Attacker",
                      BuffName = "AegisoftheLegionAuraFriend",
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
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 1200,
              Flags = "AffectFriends AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBGetPetOwner,
                Params = {PetVar = "Owner", DestVar = "Caster"}
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Owner",
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      CasterVar = "Caster",
                      BuffName = "AegisoftheLegionAuraFriend"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Attacker",
                          BuffName = "AegisoftheLegionAuraSelf",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 1.2,
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
                Function = BBElseIf,
                Params = {
                  Src1Var = "Unit",
                  Src2Var = "Caster",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "AegisoftheLegionAuraFriend",
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
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "ZettasManaManipulator_itm.troy",
      Flags = 0,
      EffectIDVar = "Aegis",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_CASTER,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Aegis",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aegisofthelegionauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aegisofthelegionaurafriend"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zettasmanamanipulator_itm.troy"
    }
  }
}
