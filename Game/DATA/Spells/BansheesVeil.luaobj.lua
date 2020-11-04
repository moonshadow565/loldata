NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "066_Sindoran_Shielding_Amulet.dds"
BuffName = "BansheesVeil"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Attacker",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Duration",
      Value2 = 37037,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SpellEffect_proc.troy",
          Flags = 0,
          EffectIDVar = "ar",
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XerathAscended"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "bansheesveil_buf_tempXerath.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          BoneName = "C_BUFFBONE_GLB_CENTER_LOC",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = true,
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
          EffectName = "bansheesveil_buf.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = true,
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BansheesVeilTimer",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 45,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BansheesVeil",
          ResetDuration = 0
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      }
    }
  }
}
BuffOnBeingSpellHitBuildingBlocks = {
  {
    Function = BBSetTriggerUnit,
    Params = {TriggerVar = "Attacker"}
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Owner"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "IsAttack", Info = GetIsAttackOverride}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsAttack",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DoesntBreakShields",
              Src1VarTable = "SpellVars",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "SpellEffect_proc.troy",
                  Flags = 0,
                  EffectIDVar = "ar",
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
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "DoesntBreakShields",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "DoesntTriggerSpellCasts",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "SpellEffect_proc.troy",
                  Flags = 0,
                  EffectIDVar = "ar",
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
      Name = "spelleffect_proc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bansheesveil_buf_tempxerath.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bansheesveil_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bansheesveiltimer"
    }
  }
}
