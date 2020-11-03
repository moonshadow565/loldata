NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 5.25
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffStartTime,
    Params = {
      DestVar = "ChannelStartTime",
      DestVarTable = "InstanceVars",
      TargetVar = "Owner",
      BuffName = "OdinCaptureChannelBomb"
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageType",
          Value2 = DAMAGESOURCE_PERIODIC,
          CompareOp = CO_DAMAGE_SOURCETYPE_IS
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetDamagingBuffName,
            Params = {DestVar = "BuffName"}
          },
          {
            Function = BBGetBuffStartTime,
            Params = {
              DestVar = "DamageStartTime",
              TargetVar = "Owner",
              BuffNameVar = "BuffName"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CancelChannel",
              SrcValue = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageStartTime",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "CancelChannel",
                  SrcValue = true
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageStartTime",
              Src2Var = "ChannelStartTime",
              Src2VarTable = "InstanceVars",
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "CancelChannel",
                  SrcValue = true
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CancelChannel",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "Ezreal_essenceflux_tar.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "root",
                  TargetObjectVar = "Owner",
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
                Function = BBIssueOrder,
                Params = {
                  WhomToOrderVar = "Owner",
                  TargetOfOrderVar = "Owner",
                  Order = AI_ORDER_NONE
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "OdinChannelVision",
                  ResetDuration = 0
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          }
        }
      }
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "OdinCaptureBeam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
      TargetObjectVar = "Target",
      TargetBoneName = "spine",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "OdinCaptureBeam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
      TargetObjectVar = "Target",
      TargetBoneName = "spine",
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
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      BuffName = "OdinBombSuppression"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = true
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ChargeTimePassed",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "OdinChannelVision",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
ChannelingUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ChargeTimePassed",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "AccumTime",
          Value2 = 1.5,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ChargeTimePassed",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "ParticleID2",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "OdinCaptureBeamEngaged.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
              TargetObjectVar = "Target",
              TargetBoneName = "spine",
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "OdinCaptureBeamEngaged.troy",
              Flags = 0,
              EffectIDVar = "ParticleID2",
              EffectIDVarTable = "InstanceVars",
              BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
              TargetObjectVar = "Target",
              TargetBoneName = "spine",
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
            Function = BBUnlockAnimation,
            Params = {OwnerVar = "Owner", Blend = true}
          },
          {
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "Channel",
              ScaleTime = 0,
              TargetVar = "Owner",
              Loop = true,
              Blend = true,
              Lock = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "OdinCaptureChannelBomb"
    },
    SubBlocks = {
      {
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Owner",
          StopCondition = ChannelingStopCondition_Cancel,
          StopSource = ChannelingStopSource_Move
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ChargeTimePassed",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCaptureChannelBomb"
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Target",
              BuffName = "OdinBombSuppression"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetTeamID,
                Params = {
                  TargetVar = "Owner",
                  DestVar = "TeamOfOwner"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TeamOfOwner",
                  Value2 = TEAM_ORDER,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "OdinBombSuppressionOrder",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 10,
                      NumberOfStacks = 1,
                      Duration = 30,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
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
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "OdinBombSuppressionChaos",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 10,
                      NumberOfStacks = 1,
                      Duration = 30,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "OdinBombSuppression",
                  BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
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
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "OdinGuardianSuppressionBomb",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "OdinChannelVision",
      ResetDuration = 0
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CooldownToSet",
          SrcValue = 0
        }
      },
      {
        Function = BBSetUseSlotSpellCooldownTime,
        Params = {
          Src = 0,
          OwnerVar = "Owner",
          BroadcastEvent = false
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
          DestVar = "CooldownToSet",
          SrcValue = 4
        }
      },
      {
        Function = BBSetUseSlotSpellCooldownTime,
        Params = {
          Src = 4,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      }
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinBombSuccessParticle"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCaptureChannelBomb",
          ResetDuration = 0
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppressionChaos",
          NumStacks = 1
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppressionOrder",
          NumStacks = 1
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "OdinChannelVision",
          ResetDuration = 0
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CooldownToSet",
              SrcValue = 0
            }
          },
          {
            Function = BBSetUseSlotSpellCooldownTime,
            Params = {
              Src = 0,
              OwnerVar = "Owner",
              BroadcastEvent = false
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
              DestVar = "CooldownToSet",
              SrcValue = 4
            }
          },
          {
            Function = BBSetUseSlotSpellCooldownTime,
            Params = {
              Src = 4,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppression",
          NumStacks = 1
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
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCaptureChannelBomb",
          ResetDuration = 0
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "OdinCaptureCancel.troy",
          Flags = 0,
          BoneName = "spine",
          TargetObjectVar = "Owner",
          TargetBoneName = "spine",
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
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppressionChaos",
          NumStacks = 1
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppressionOrder",
          NumStacks = 1
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "OdinChannelVision",
          ResetDuration = 0
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CooldownToSet",
              SrcValue = 0
            }
          },
          {
            Function = BBSetUseSlotSpellCooldownTime,
            Params = {
              Src = 0,
              OwnerVar = "Owner",
              BroadcastEvent = false
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
              DestVar = "CooldownToSet",
              SrcValue = 4
            }
          },
          {
            Function = BBSetUseSlotSpellCooldownTime,
            Params = {
              Src = 4,
              OwnerVar = "Owner",
              BroadcastEvent = false
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OdinBombSuppression",
          NumStacks = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincapturechannelbomb"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinchannelvision"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturebeam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppression"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturebeamengaged.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppressionorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuppressionchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombsuccessparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturecancel.troy"
    }
  }
}
