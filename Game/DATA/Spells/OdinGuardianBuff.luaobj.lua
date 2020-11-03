NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_FerociousHowl.dds"
BuffName = "Ferocious Howl"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = "pelvis"
AutoCooldownByLevel = {
  120,
  100,
  80,
  10,
  10
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhostProof
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "MyTeam",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "orderTeam",
      DestVarTable = "InstanceVars",
      SrcValue = TEAM_ORDER
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "chaosTeam",
      DestVarTable = "InstanceVars",
      SrcValue = TEAM_CHAOS
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "orderTeam",
      TeamVarTable = "InstanceVars",
      Radius = 800,
      TargetVar = "Owner",
      Duration = 25000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "chaosTeam",
      TeamVarTable = "InstanceVars",
      Radius = 800,
      TargetVar = "Owner",
      Duration = 25000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID2",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Health",
          OwnerVar = "Owner",
          Function = GetMaxPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Health",
          Src1Value = 0,
          Src2Value = -0.5,
          DestVar = "Damage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "Damage"
        }
      }
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
          BindObjectVar = "Owner",
          EffectName = "OdinNeutralGuardian_Green.troy",
          EffectNameForOtherTeam = "OdinNeutralGuardian_Red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "Particle2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "crystal",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
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
          BindObjectVar = "Owner",
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
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
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 0,
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
    Function = BBElseIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "OdinNeutralGuardian_Green.troy",
          EffectNameForOtherTeam = "OdinNeutralGuardian_Red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          EffectID2Var = "Particle2",
          EffectID2VarTable = "InstanceVars",
          BoneName = "crystal",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
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
          BindObjectVar = "Owner",
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
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
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 0,
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
          EffectName = "OdinNeutralGuardian_Stone.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "crystal",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
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
          EffectName = "OdinNeutralGuardian_Stone.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          BoneName = "crystal",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
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
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
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
          EffectName = "blank.troy",
          Flags = 0,
          EffectIDVar = "PlatformParticle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 0,
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBRemovePerceptionBubble,
        Params = {
          BubbleIDVar = "BubbleID2",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "PlatformParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "PlatformParticle2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 900,
      Flags = "AffectEnemies AffectMinions AffectNotPet NotAffectSelf ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "OdinSuperMinion"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MagicResistBuff",
              DestVarTable = "NextBuffVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ArmorBuff",
              DestVarTable = "NextBuffVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "OdinMinionTaunt",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "OdinMinion"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MagicResistBuff",
              DestVarTable = "NextBuffVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "ArmorBuff",
              DestVarTable = "NextBuffVars",
              SrcValue = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "OdinMinionTaunt",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
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
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "CurrentTeam"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentTeam",
      Src2Var = "MyTeam",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "GoldAquisition_glb.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          BoneName = "root",
          TargetObjectVar = "Owner",
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
        Function = BBRemovePerceptionBubble,
        Params = {
          BubbleIDVar = "BubbleID",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyTeam",
          Src1VarTable = "InstanceVars",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBRemovePerceptionBubble,
            Params = {
              BubbleIDVar = "BubbleID2",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MyTeam",
          DestVarTable = "InstanceVars",
          SrcVar = "CurrentTeam"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "PlatformParticle",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "PlatformParticle2",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyTeam",
          Src1VarTable = "InstanceVars",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "Activate",
              ScaleTime = 0,
              TargetVar = "Owner",
              Loop = false,
              Blend = true,
              Lock = false
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Idle1",
              OverrideAnim = "Floating",
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "OdinNeutralGuardian_Green.troy",
              EffectNameForOtherTeam = "OdinNeutralGuardian_Red.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              EffectID2Var = "Particle2",
              EffectID2VarTable = "InstanceVars",
              BoneName = "crystal",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
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
              BindObjectVar = "Owner",
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
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
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "TeamID",
              Radius = 800,
              TargetVar = "Owner",
              Duration = 25000,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = true,
              BubbleIDVar = "BubbleID",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "MyTeam",
          Src1VarTable = "InstanceVars",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "Activate",
              ScaleTime = 0,
              TargetVar = "Owner",
              Loop = false,
              Blend = true,
              Lock = false
            }
          },
          {
            Function = BBOverrideAnimation,
            Params = {
              ToOverrideAnim = "Idle1",
              OverrideAnim = "Floating",
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "OdinNeutralGuardian_Green.troy",
              EffectNameForOtherTeam = "OdinNeutralGuardian_Red.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              EffectID2Var = "Particle2",
              EffectID2VarTable = "InstanceVars",
              BoneName = "crystal",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
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
              BindObjectVar = "Owner",
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
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
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "TeamID",
              Radius = 800,
              TargetVar = "Owner",
              Duration = 25000,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = true,
              BubbleIDVar = "BubbleID",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "Deactivate",
              ScaleTime = 0,
              TargetVar = "Owner",
              Loop = false,
              Blend = false,
              Lock = false
            }
          },
          {
            Function = BBClearOverrideAnimation,
            Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "OdinNeutralGuardian_Stone.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              BoneName = "crystal",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
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
              EffectName = "OdinNeutralGuardian_Stone.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              BoneName = "crystal",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
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
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
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
              EffectName = "blank.troy",
              Flags = 0,
              EffectIDVar = "PlatformParticle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "orderTeam",
              TeamVarTable = "InstanceVars",
              Radius = 800,
              TargetVar = "Owner",
              Duration = 25000,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = true,
              BubbleIDVar = "BubbleID",
              BubbleIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "chaosTeam",
              TeamVarTable = "InstanceVars",
              Radius = 800,
              TargetVar = "Owner",
              Duration = 25000,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = true,
              BubbleIDVar = "BubbleID2",
              BubbleIDVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.65
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count1",
          TargetVar = "Owner",
          BuffName = "OdinGuardianSuppression"
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count2",
          TargetVar = "Owner",
          BuffName = "OdinMinionSpellAttack"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count1",
          Src2Var = "Count2",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Count",
          MathOp = MO_ADD
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
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "HealAmount", SrcValue = 300}
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_NEUTRAL,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "MaxHealth",
                  OwnerVar = "Owner",
                  Function = GetMaxPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MaxHealth",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "HalfHealth",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "CurHealth",
                  OwnerVar = "Owner",
                  Function = GetPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HalfHealth",
                  Src2Var = "CurHealth",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HealAmount",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HealAmount",
                  Src1Value = 0,
                  Src2Value = 150,
                  DestVar = "HealAmount",
                  MathOp = MO_MIN
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "HealAmount",
                  Src1Value = 0,
                  Src2Value = -150,
                  DestVar = "HealAmount",
                  MathOp = MO_MAX
                }
              }
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "HealAmount"
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
      Name = "odinneutralguardian_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {Name = "blank.troy"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odinneutralguardian_stone.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinsuperminion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinminiontaunt"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "odinminion"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "goldaquisition_glb.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
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
      Name = "odinminionspellattack"
    }
  }
}
