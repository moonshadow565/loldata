AutoBuffActivateEffect = "InnervatingLocket_itm.troy "
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CooldownResevoir",
          Src1VarTable = "InstanceVars",
          Value2 = 2,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaRegenBonus",
          DestVarTable = "NextBuffVars",
          SrcValue = 1.5
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 800,
          Flags = "AffectFriends AffectHeroes ",
          IteratorVar = "Unit"
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
                  BuffName = "ManaManipulatorAuraSelf",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 3.1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
                  BuffName = "ManaManipulatorAuraFriend",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 3.1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
ItemOnSpellCastBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "CooldownResevoir",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DoesntTriggerSpellCasts",
          Src1VarTable = "SpellVars",
          Value2 = true,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "CooldownResevoir",
              Src2VarTable = "InstanceVars",
              Src1Value = -1,
              Src2Value = 0,
              DestVar = "CooldownResevoir",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 900,
              Flags = "AffectFriends AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "InnervatingLocket_itm.troy",
                      Flags = 0,
                      EffectIDVar = "Particle",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "InnervatingLocketBuff",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberStacks = 1,
                      Duration = 1.9,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBGetManaOrHealth,
                    Params = {
                      DestVar = "UnitHealth",
                      OwnerVar = "Unit",
                      Function = GetHealthPercent
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "UnitHealth",
                      Value2 = 1,
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "InnervatingLocket_itm.troy",
                          Flags = 0,
                          EffectIDVar = "Particle",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "InnervatingLocketBuff",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberStacks = 1,
                          Duration = 1.9,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
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
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownResevoir",
      DestVarTable = "InstanceVars",
      SrcValue = 2
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manamanipulatorauraself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manamanipulatoraurafriend"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "innervatinglocket_itm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "innervatinglocketbuff"
    }
  }
}
