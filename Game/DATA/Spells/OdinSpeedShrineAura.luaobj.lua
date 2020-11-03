BuffTextureName = ""
BuffName = "OdinShamanAura"
PersistsThroughDeath = true
Nondispellable = true
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Net,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Sleep,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Snare,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Taunt,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Suppression,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_BlackShield_immune"
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
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
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "OrderTeam", SrcValue = TEAM_ORDER}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "ChaosTeam", SrcValue = TEAM_CHAOS}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Owner",
      EffectName = "odin_shrine_time.troy",
      Flags = 0,
      EffectIDVar = "ParticleOrder",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_ORDER,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 250,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = true,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Owner",
      EffectName = "odin_shrine_time.troy",
      Flags = 0,
      EffectIDVar = "ParticleChaos",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_CHAOS,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 250,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = true,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "OrderTeam",
      Radius = 250,
      PosVar = "Owner",
      Duration = 1,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "MyBubble"
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "ChaosTeam",
      Radius = 250,
      PosVar = "Owner",
      Duration = 1,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "MyBubble2"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleOrder",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleChaos",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 365,
          Flags = "AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Unit",
              BuffName = "OdinShrineBombBuff"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 1,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "NewDuration",
                  SrcValue = 10
                }
              },
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "MonsterBuffs"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "NewDuration",
                      Src1Value = 1.2,
                      Src2Value = 0,
                      DestVar = "NewDuration",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 0.3
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "OdinSpeedShrineBuff",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "NewDuration",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
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
      Name = "odin_shrine_time.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinspeedshrinebuff"
    }
  }
}
