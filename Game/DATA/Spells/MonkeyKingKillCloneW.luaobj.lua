OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoOnce",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
          EffectName = "monkeyKing_W_cas_team_ID_green.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          BoneName = "L_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_green.troy",
          Flags = 0,
          EffectIDVar = "b",
          EffectIDVarTable = "InstanceVars",
          BoneName = "R_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_red.troy",
          Flags = 0,
          EffectIDVar = "c",
          EffectIDVarTable = "InstanceVars",
          BoneName = "L_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_red.troy",
          Flags = 0,
          EffectIDVar = "d",
          EffectIDVarTable = "InstanceVars",
          BoneName = "R_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
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
          EffectName = "monkeyKing_W_cas_team_ID_green.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          BoneName = "L_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_green.troy",
          Flags = 0,
          EffectIDVar = "b",
          EffectIDVarTable = "InstanceVars",
          BoneName = "R_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_red.troy",
          Flags = 0,
          EffectIDVar = "c",
          EffectIDVarTable = "InstanceVars",
          BoneName = "L_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "monkeyKing_W_cas_team_ID_red.troy",
          Flags = 0,
          EffectIDVar = "d",
          EffectIDVarTable = "InstanceVars",
          BoneName = "R_hand",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "d",
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 9999,
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
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetNoRender
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "DoOnce",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
                  PosVar = "OwnerPos",
                  EffectName = "MonkeyKing_W_death_team_ID_green.troy",
                  Flags = 0,
                  EffectIDVar = "aa",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "OwnerPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "MonkeyKing_W_death_team_ID_red.troy",
                  Flags = 0,
                  EffectIDVar = "bb",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "OwnerPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
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
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "MonkeyKing_W_death_team_ID_green.troy",
                  Flags = 0,
                  EffectIDVar = "aa",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "OwnerPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "MonkeyKing_W_death_team_ID_red.troy",
                  Flags = 0,
                  EffectIDVar = "bb",
                  TargetObjectVar = "Owner",
                  TargetPosVar = "OwnerPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DoOnce",
              DestVarTable = "InstanceVars",
              SrcValue = true
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
      Name = "monkeyking_w_cas_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkeyking_w_cas_team_id_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkeyking_w_death_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "monkeyking_w_death_team_id_red.troy"
    }
  }
}
