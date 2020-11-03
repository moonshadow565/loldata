DoesntBreakShields = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Attacker",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IsDead",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "YorickActiveRavenous"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "YorickActiveRavenous"
        }
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {
      UnitVar = "Attacker",
      PositionVar = "GhoulPosition"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "GhoulPosition",
      EffectName = "yorick_ravenousGhoul_death.troy",
      Flags = 0,
      EffectIDVar = "b",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Attacker",
      Damage = 9999,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentHealth",
      OwnerVar = "Attacker",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentHealth",
      Value2 = 0,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "IsDead",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Attacker",
          Range = 500,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "YorickRavenousPrimaryTarget",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Unit",
              TargetVar = "Attacker",
              Duration = 1.5
            }
          }
        }
      },
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Attacker",
          DestVar = "IsTaunted",
          Status = GetTaunted
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsTaunted",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NearbyChampion",
              SrcValue = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CheckBuilding",
              SrcValue = true
            }
          },
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Attacker",
              Range = 1050,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Unit",
                  TargetVar = "Attacker",
                  Duration = 1.5
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "NearbyChampion",
                  SrcValue = true
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "CheckBuilding",
                  SrcValue = false
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "NearbyChampion",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Attacker",
                  Range = 750,
                  Flags = "AffectEnemies AffectMinions ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBApplyTaunt,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Attacker",
                      Duration = 1.5
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "CheckBuilding",
                      SrcValue = false
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CheckBuilding",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForNClosestUnitsInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Attacker",
                  Range = 750,
                  Flags = "AffectEnemies AffectBuildings ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBApplyTaunt,
                    Params = {
                      AttackerVar = "Unit",
                      TargetVar = "Attacker",
                      Duration = 1.5
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Blinky",
      Skin = "YorickRavenousGhoul",
      AiScript = "YorickPHPet.lua",
      PosVar = "TargetPos",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = false,
      Silenced = true,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = false,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Other1",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "YorickRavenousLogic",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickactiveravenous"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ravenousghoul_death.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickravenousprimarytarget"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "yorickravenousghoul"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickravenouslogic"
    }
  }
}
