NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 30
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
      BuffName = "OdinCaptureChannel"
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
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "OdinCaptureChannel"
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "OdinCaptureInterrupt",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 3,
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
ChannelingStartBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "OdinCaptureImmobile",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
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
      AttackerVar = "Attacker",
      BuffName = "OdinGuardianSuppression",
      BuffAddType = BUFF_RENEW_EXISTING,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HasPrilisasBlessing",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "PrilisasBlessingCount",
      TargetVar = "Owner",
      BuffName = "PrilisasBlessing"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PrilisasBlessingCount",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HasPrilisasBlessing",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "PrilisasBlessing",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
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
  },
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
          AttackerVar = "Attacker",
          BuffName = "OdinGuardianSuppressionOrder",
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
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "OdinCaptureBeam.troy",
          EffectNameForOtherTeam = "OdinCaptureBeam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "ParticleID2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
          TargetObjectVar = "Target",
          TargetBoneName = "crystal",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          AttackerVar = "Attacker",
          BuffName = "OdinGuardianSuppressionChaos",
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
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "OdinCaptureBeam.troy",
          EffectNameForOtherTeam = "OdinCaptureBeam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "ParticleID2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
          TargetObjectVar = "Target",
          TargetBoneName = "crystal",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
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
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Mana",
      OwnerVar = "Target",
      Function = GetPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxMana",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Mana",
      Src2Var = "MaxMana",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PAR_Percent",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PAR_Percent",
      Value2 = 0.8,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Target",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OdinScoreNinja",
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
      }
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Channel_WNDUP",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = true,
      Blend = true,
      Lock = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RemoveAnim",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "AccumTime",
      Value2 = 1.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinShrineBombBuff"
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
                  BuffName = "OdinBombTickOrder",
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
                  BuffName = "OdinBombTickChaos",
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
              }
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OdinShrineBombBuff"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "RemoveAnim",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
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
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RemoveAnim",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          }
        }
      }
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "OdinCaptureBeamEngaged_red.troy",
                  EffectNameForOtherTeam = "OdinCaptureBeamEngaged_green.troy",
                  Flags = 0,
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars",
                  EffectID2Var = "ParticleID2",
                  EffectID2VarTable = "InstanceVars",
                  BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
                  TargetObjectVar = "Target",
                  TargetBoneName = "crystal",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = false,
                  PersistsThroughReconnect = false,
                  BindFlexToOwnerPAR = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
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
                  EffectName = "OdinCaptureBeamEngaged_green.troy",
                  EffectNameForOtherTeam = "OdinCaptureBeamEngaged_red.troy",
                  Flags = 0,
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars",
                  EffectID2Var = "ParticleID2",
                  EffectID2VarTable = "InstanceVars",
                  BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
                  TargetObjectVar = "Target",
                  TargetBoneName = "crystal",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = false,
                  PersistsThroughReconnect = false,
                  BindFlexToOwnerPAR = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
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
      BuffName = "OdinCaptureChannel"
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
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Target",
          CasterVar = "Owner",
          BuffName = "OdinGuardianSuppressionOrder"
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
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Target",
          CasterVar = "Owner",
          BuffName = "OdinGuardianSuppressionChaos"
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
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Target", DestVar = "TargetTeam"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "MyTeam"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MyTeam",
      Src2Var = "TargetTeam",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Owner",
          StopCondition = ChannelingStopCondition_Success,
          StopSource = ChannelingStopSource_Move
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianSuppressionChaos",
      NumStacks = 1
    }
  },
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianSuppressionOrder",
      NumStacks = 1
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
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetUseSlotSpellCooldownTime,
        Params = {
          Src = 3,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CooldownToSet",
          SrcValue = 3
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCaptureChannelCooldownBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "CooldownToSet",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinScoreNinja"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasPrilisasBlessing",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "PrilisasBlessing",
          NumStacks = 1
        }
      }
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinCaptureChannel"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
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
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = true}
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
      BuffName = "OdinGuardianSuppressionChaos",
      NumStacks = 1
    }
  },
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianSuppressionOrder",
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
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinScoreNinja"
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
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetUseSlotSpellCooldownTime,
        Params = {
          Src = 3,
          OwnerVar = "Owner",
          BroadcastEvent = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CooldownToSet",
          SrcValue = 3
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinCaptureChannelCooldownBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "CooldownToSet",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasPrilisasBlessing",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "PrilisasBlessing",
          NumStacks = 1
        }
      }
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OdinCaptureChannel"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincapturechannel"
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
      Name = "odincaptureinterrupt"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincaptureimmobile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "prilisasblessing"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardiansuppressionorder"
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
      Name = "odinguardiansuppressionchaos"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinscoreninja"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinshrinebombbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombtickorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinbombtickchaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturebeamengaged_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturebeamengaged_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odincapturechannelcooldownbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odincapturecancel.troy"
    }
  }
}
