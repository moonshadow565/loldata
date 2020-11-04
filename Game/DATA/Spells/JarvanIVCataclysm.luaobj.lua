NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "JarvanIV_Cataclysm.dds"
BuffName = "JarvanIVCataclysm"
SpellToggleSlot = 4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasDealtDamage",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasCreatedRing",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "JarvanCataclysm_sound.troy",
      Flags = 0,
      EffectIDVar = "CataclysmSound",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaReduction",
      SrcValueByLevel = {
        -100,
        -125,
        -150
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NewCd",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        120,
        105,
        90,
        0,
        0
      }
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "ManaReduction",
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Self,
      TargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "CataclysmSound",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "NewCd",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = true
    }
  },
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Target,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasDealtDamage",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Attacker"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 500,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanCast
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HasDealtDamage",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Attacker",
              PosVar = "Attacker",
              EndPosVar = "Attacker",
              OverrideCastPosition = false,
              SlotNumber = 1,
              SlotType = ExtraSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = true,
              FireWithoutCasting = false,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanCast",
      Status = GetCanCast
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanMove",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanCast",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "JarvanIVCataclysm"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 1,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "JarvanIVCataclysm"
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "JarvanIVCataclysmAttack"
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
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffName = "JarvanIVCataclysm",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UnstoppableForceMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "JarvanIVCataclysmVisibility",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Target"
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Target", PositionVar = "TargetPos"}
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "TargetPos",
          Speed = 2000,
          Gravity = 150,
          MoveBackBy = 0,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = CANCEL_ORDER,
          MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
          IdealDistance = 700
        }
      },
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 1,
          SlotNumber = 3,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      }
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasCreatedRing",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "CenterPos"}
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "teamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "JarvanCataclysm_tar.troy",
          Flags = 0,
          EffectIDVar = "groundhit",
          BoneName = "weapon_C",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBForEachPointAroundCircle,
        Params = {
          CenterVar = "CenterPos",
          Radius = 350,
          Iterations = 12,
          IteratorVar = "Pos"
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "JarvanIVWall",
              Skin = "JarvanIVWall",
              AiScript = "idle.lua",
              PosVar = "Pos",
              Team = TEAM_UNKNOWN,
              TeamVar = "teamID",
              Stunned = true,
              Rooted = true,
              Silenced = true,
              Invulnerable = true,
              MagicImmune = true,
              IgnoreCollision = true,
              IsWard = false,
              Placemarker = false,
              VisibilitySize = 0,
              DestVar = "Other2",
              GoldRedirectTargetVar = "Owner"
            }
          },
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Other2", LocationVar = "CenterPos"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Other2",
              BuffName = "JarvanIVCataclysmAttack",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = false,
              BuffType = BUFF_Internal,
              MaxStack = 50,
              NumberOfStacks = 1,
              Duration = 3.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Other2",
              Range = 100,
              Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes NotAffectSelf ",
              IteratorVar = "Unit",
              BuffNameFilter = "CrystallizePush",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "PushDistance",
                      SrcValue = 110
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "PushDistance",
                      SrcValue = 125
                    }
                  }
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Other2",
                  Src2Var = "Unit",
                  CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
                },
                SubBlocks = {
                  {
                    Function = BBGetPointByUnitFacingOffset,
                    Params = {
                      UnitVar = "Other2",
                      Distance = 0,
                      DistanceVar = "PushDistance",
                      OffsetAngle = 0,
                      PositionVar = "TargetPos"
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBGetUnitPosition,
                    Params = {UnitVar = "Unit", PositionVar = "unitPos"}
                  },
                  {
                    Function = BBGetUnitPosition,
                    Params = {UnitVar = "Other2", PositionVar = "ownerPos"}
                  },
                  {
                    Function = BBDistanceBetweenPoints,
                    Params = {
                      DestVar = "distance",
                      Point1Var = "unitPos",
                      Point2Var = "ownerPos"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "distance",
                      Value2 = 60,
                      CompareOp = CO_LESS_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBGetPointByUnitFacingOffset,
                        Params = {
                          UnitVar = "Other2",
                          Distance = 0,
                          DistanceVar = "PushDistance",
                          OffsetAngle = 0,
                          PositionVar = "TargetPos"
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBGetPointByUnitFacingOffset,
                        Params = {
                          UnitVar = "Other2",
                          Distance = 0,
                          DistanceVar = "PushDistance",
                          OffsetAngle = 180,
                          PositionVar = "TargetPos"
                        }
                      }
                    }
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TargetPos",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TargetPos"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Other2",
                  BuffName = "CrystallizePush",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 76,
                  NumberOfStacks = 1,
                  Duration = 0.25,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Attacker",
                  Src2Var = "Unit",
                  CompareOp = CO_DIFFERENT_TEAM
                },
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageType = TRUE_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_DEFAULT,
                      PercentOfAttack = 0,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1200,
          Flags = "AffectEnemies AffectFriends AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBForceRefreshPath,
                Params = {UnitVar = "Unit"}
              }
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HasCreatedRing",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "UnstoppableForceMarker"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvancataclysm_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmvisibility"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvancataclysm_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "jarvanivwall"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "crystallizepush"
    }
  }
}
