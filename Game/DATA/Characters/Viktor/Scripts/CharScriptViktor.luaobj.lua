UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HasRemoved",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ViktorAugmentQ"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "StaffIdle",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "StaffIdle2",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HasRemoved",
              DestVarTable = "CharVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "Viktorb_yellow.troy",
              EffectNameForOtherTeam = "Viktorb_yellow.troy",
              Flags = 0,
              EffectIDVar = "StaffIdleYELLOW",
              EffectIDVarTable = "InstanceVars",
              EffectID2Var = "StaffIdleYELLOW2",
              BoneName = "BUFFBONE_CSTM_WEAPON_1",
              TargetObjectVar = "Owner",
              TargetBoneName = "BUFFBONE_CSTM_WEAPON_1",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_UNKNOWN,
              SpecificTeamOnlyOverrideVar = "OwnerTeam",
              UseSpecificUnit = false,
              FOWTeam = TEAM_NEUTRAL,
              FOWTeamOverrideVar = "OwnerTeam",
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
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "ViktorAugmentW"
            },
            SubBlocks = {
              {
                Function = BBSpellEffectRemove,
                Params = {
                  EffectIDVar = "StaffIdle",
                  EffectIDVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellEffectRemove,
                Params = {
                  EffectIDVar = "StaffIdle2",
                  EffectIDVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "HasRemoved",
                  DestVarTable = "CharVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "Viktorb_blue.troy",
                  EffectNameForOtherTeam = "Viktorb_blue.troy",
                  Flags = 0,
                  EffectIDVar = "StaffIdleBLUE",
                  EffectIDVarTable = "InstanceVars",
                  EffectID2Var = "StaffIdleBLUE2",
                  BoneName = "BUFFBONE_CSTM_WEAPON_1",
                  TargetObjectVar = "Owner",
                  TargetBoneName = "BUFFBONE_CSTM_WEAPON_1",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  SpecificTeamOnlyOverrideVar = "OwnerTeam",
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_NEUTRAL,
                  FOWTeamOverrideVar = "OwnerTeam",
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
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "ViktorAugmentE"
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectRemove,
                    Params = {
                      EffectIDVar = "StaffIdle",
                      EffectIDVarTable = "InstanceVars"
                    }
                  },
                  {
                    Function = BBSpellEffectRemove,
                    Params = {
                      EffectIDVar = "StaffIdle2",
                      EffectIDVarTable = "InstanceVars"
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "HasRemoved",
                      DestVarTable = "CharVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "Viktorb_red.troy",
                      EffectNameForOtherTeam = "Viktorb_red.troy",
                      Flags = 0,
                      EffectIDVar = "StaffIdleRED",
                      EffectIDVarTable = "InstanceVars",
                      EffectID2Var = "StaffIdleRED2",
                      BoneName = "BUFFBONE_CSTM_WEAPON_1",
                      TargetObjectVar = "Owner",
                      TargetBoneName = "BUFFBONE_CSTM_WEAPON_1",
                      SpecificUnitOnlyVar = "Nothing",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      SpecificTeamOnlyOverrideVar = "OwnerTeam",
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_NEUTRAL,
                      FOWTeamOverrideVar = "OwnerTeam",
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
          }
        }
      }
    }
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ViktorPassiveAPPerLev",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBCreateItem,
    Params = {UnitVar = "Owner", ItemID = 3200}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Viktor_idle.troy",
      EffectNameForOtherTeam = "Viktor_idle.troy",
      Flags = 0,
      EffectIDVar = "StaffIdle",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "StaffIdle2",
      EffectID2VarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_CSTM_WEAPON_1",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_NEUTRAL,
      SpecificTeamOnlyOverrideVar = "OwnerTeam",
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "OwnerTeam",
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
CharOnResurrectBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ViktorPassiveAPPerLev",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
CharOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      OverrideCastPosition = false,
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktorb_yellow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktorb_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktorb_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorpassiveapperlev"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_idle.troy"
    }
  }
}
