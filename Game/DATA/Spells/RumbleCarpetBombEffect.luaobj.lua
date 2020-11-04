BuffTextureName = "034_Steel_Shield.dds"
BuffName = "Danger Zone"
AutoBuffActivateEffect = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Counter",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MissilePosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissilePosition",
      SrcVar = "MissilePosition",
      SrcVarTable = "InstanceVars"
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
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Attacker",
      SkinIDVar = "RumbleSkinID"
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
          BindObjectVar = "Nothing",
          PosVar = "MissilePosition",
          EffectName = "rumble_ult_impact.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamOfOwner",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "RumbleSkinID",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_cannon_ball_team_ID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_ORDER,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_cannon_ball_team_ID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_CHAOS,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "RumbleSkinID",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_pineapple_team_ID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_ORDER,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_pineapple_team_ID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_CHAOS,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
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
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_teamID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_ORDER,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_teamID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_CHAOS,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "MissilePosition",
          EffectName = "rumble_ult_impact.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamOfOwner",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "RumbleSkinID",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_cannon_ball_team_ID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_cannon_ball_team_ID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "RumbleSkinID",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_pineapple_team_ID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_pineapple_team_ID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
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
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_teamID_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissilePosition",
              EffectName = "rumble_ult_impact_burn_teamID_green.troy",
              Flags = 0,
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamOfOwner",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          }
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars"
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissilePosition",
          SrcVar = "MissilePosition",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "MissilePosition",
          Range = 205,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "RumbleCarpetBombSlow",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
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
            Function = BBGetTeamID,
            Params = {
              TargetVar = "Attacker",
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
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "RumbleCarpetBombBurnOrder",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = false,
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
                  BuffName = "RumbleCarpetBombBurnDest",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = false,
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_cannon_ball_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_cannon_ball_team_id_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_pineapple_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_pineapple_team_id_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_teamid_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_ult_impact_burn_teamid_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombburnorder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblecarpetbombburndest"
    }
  }
}
