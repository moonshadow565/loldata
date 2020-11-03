DoesntBreakShields = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "YorickPHSpectral.troy",
      Flags = 0,
      EffectIDVar = "SpectraFX",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackDamageMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IsDead",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Attacker",
      Range = 500,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "YorickSpectralPrimaryTarget",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_DEAD},
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "YorickSpectralPrimaryTaunt",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "YorickActiveSpectral"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "YorickActiveSpectral"
        }
      }
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {
      UnitVar = "Attacker",
      PositionVar = "GhoulPosition"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "GhoulPosition",
      EffectName = "yorick_spectralGhoul_death.troy",
      Flags = 0,
      EffectIDVar = "a",
      TargetObjectVar = "Owner",
      TargetPosVar = "GhoulPosition",
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
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Attacker",
      DeltaVar = "AttackDamageMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "MovementSpeedPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
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
          BuffNameFilter = "YorickSpectralPrimaryTarget",
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Clyde",
      Skin = "YorickSpectralGhoul",
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
      VisibilitySize = 500,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other1",
      BuffName = "YorickGhoulSummonAnim",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeedPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.15,
        0.2,
        0.25,
        0.3,
        0.35
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackDamageMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        8,
        16,
        24,
        32,
        40
      }
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
      BuffName = "YorickSpectralLogic",
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
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageToAdd",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.1,
        0.15,
        0.2,
        0.25,
        0.3
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "YorickActiveSpectral",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorickphspectral.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickspectralprimarytarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickspectralprimarytaunt"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickactivespectral"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_spectralghoul_death.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "yorickspectralghoul"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickghoulsummonanim"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickspectrallogic"
    }
  }
}
