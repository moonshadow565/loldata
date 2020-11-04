NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Shen_ShadowDash.dds"
BuffName = "Shen Shadow Dash"
BuffOnCollisionBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Target",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Target",
                  CasterVar = "Nothing",
                  BuffName = "SharedWardBuff"
                },
                SubBlocks = {
                  {
                    Function = BBIfNotHasBuff,
                    Params = {
                      OwnerVar = "Target",
                      CasterVar = "Owner",
                      BuffName = "ShenShadowDashCooldown"
                    },
                    SubBlocks = {
                      {
                        Function = BBGetTeamID,
                        Params = {TargetVar = "Owner", DestVar = "TeamID"}
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "ShenShadowDashCooldown",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 0,
                          BuffVarsTable = "NextBuffVars",
                          DurationVar = "tauntDuration",
                          DurationVarTable = "InstanceVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      },
                      {
                        Function = BBBreakSpellShields,
                        Params = {TargetVar = "Target"}
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "playParticle",
                          DestVarTable = "NextBuffVars",
                          SrcValue = true
                        }
                      },
                      {
                        Function = BBApplyTaunt,
                        Params = {
                          AttackerVar = "Attacker",
                          TargetVar = "Target",
                          Duration = 0,
                          DurationVar = "tauntDuration",
                          DurationVarTable = "InstanceVars"
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
                        SubBlocks = {
                          {
                            Function = BBIncPAR,
                            Params = {
                              TargetVar = "Owner",
                              Delta = 40,
                              PARType = PAR_ENERGY
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
  },
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "tauntDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "dashSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Distance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "TargetPos",
      Speed = 0,
      SpeedVar = "dashSpeed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = POSTPONE_CURRENT_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "Distance",
      IdealDistanceVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Shen_shadowdash_mis.troy",
      Flags = 0,
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Dash",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = false,
      Lock = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = false}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SelfParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBStartTrackingCollisions,
    Params = {TargetVar = "Owner", Value = true}
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
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 800,
      DestVar = "dashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 575,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Distance", SrcValue = 575}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 575,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Distance",
      DestVarTable = "NextBuffVars",
      SrcVar = "Distance"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "dashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "dashSpeed"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "tauntDuration",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        1,
        1.3,
        1.6,
        1.9,
        2.2
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 150,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Unit",
          CasterVar = "Owner",
          BuffName = "ShenShadowDashCooldown"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "ShenShadowDashCooldown",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "tauntDuration",
              DurationVarTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Duration = 0,
              DurationVar = "tauntDuration",
              DurationVarTable = "NextBuffVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "shen_shadowDash_unit_impact.troy",
              Flags = 0,
              EffectIDVar = "TargetParticle",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 40,
                  PARType = PAR_ENERGY
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.1,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Unit",
          CasterVar = "Owner",
          BuffName = "ShenShadowDashCooldown"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "ShenShadowDashCooldown",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "tauntDuration",
              DurationVarTable = "InstanceVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "playParticle",
              DestVarTable = "NextBuffVars",
              SrcValue = true
            }
          },
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Duration = 0,
              DurationVar = "tauntDuration",
              DurationVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "shen_shadowDash_unit_impact.troy",
              Flags = 0,
              EffectIDVar = "TargetParticle",
              TargetObjectVar = "Unit",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBIncPAR,
                Params = {
                  TargetVar = "Owner",
                  Delta = 40,
                  PARType = PAR_ENERGY
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenshadowdashcooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_shadowdash_mis.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_shadowdash_unit_impact.troy"
    }
  }
}
