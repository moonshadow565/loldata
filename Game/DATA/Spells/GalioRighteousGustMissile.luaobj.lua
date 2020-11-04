NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = "GalioRighteousGustMissile"
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetNoRender
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      SrcVar = "MoveSpeedMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 10000,
      OffsetAngle = 0,
      PositionVar = "OrientationPoint"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "galio_windTunnel_rune.troy",
          Flags = 0,
          EffectIDVar = "WindVFXAlly",
          EffectIDVarTable = "InstanceVars",
          BoneName = "head",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 240,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "OrientationPoint"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "galio_windTunnel_rune_team_red.troy",
          Flags = 0,
          EffectIDVar = "WindVFXEnemy",
          EffectIDVarTable = "InstanceVars",
          BoneName = "head",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 240,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "OrientationPoint"
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
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "galio_windTunnel_rune.troy",
          Flags = 0,
          EffectIDVar = "WindVFXAlly",
          EffectIDVarTable = "InstanceVars",
          BoneName = "head",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 240,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "OrientationPoint"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "galio_windTunnel_rune_team_red.troy",
          Flags = 0,
          EffectIDVar = "WindVFXEnemy",
          EffectIDVarTable = "InstanceVars",
          BoneName = "head",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 240,
          SendIfOnScreenOrDiscard = false,
          OrientTowardsVar = "OrientationPoint"
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      DestVarTable = "InstanceVars",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = ExtraSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "WindVFXAlly",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "WindVFXEnemy",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 5000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "MoveSpeedMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetChampionBySkinName,
    Params = {
      Skin = "Galio",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      DestVar = "Other1"
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 175,
          Flags = "AffectFriends AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "GalioRighteousGustMissile",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Attacker",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Attacker",
                  Src2Var = "Unit",
                  CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Attacker",
                      CompareOp = CO_IS_TARGET_BEHIND_ME
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Other1",
                          BuffName = "GalioRighteousGustHaste",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Aura,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 0.3,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      },
                      {
                        Function = BBApplyAssistMarker,
                        Params = {
                          Duration = 10,
                          TargetVar = "Unit",
                          SourceVar = "Other1"
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffRemove,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Other1",
                          BuffName = "GalioRighteousGustHaste"
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
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Other1",
                      BuffName = "GalioRighteousGustHaste"
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
SpellOnMissileUpdateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Level", Info = GetCastSpellLevelPlusOne}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.25,
        0.3,
        0.35,
        0.4,
        0.45
      }
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "RighteousGust",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "MissilePosition",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = false,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 100,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other3", LocationVar = "TargetPos"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_windtunnel_rune.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_windtunnel_rune_team_red.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "galio"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorighteousgustmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiorighteousgusthaste"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  }
}
