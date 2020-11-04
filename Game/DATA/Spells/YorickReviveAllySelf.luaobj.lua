BuffTextureName = "YorickOmenOfDeath.dds"
BuffName = "YorickOmenPreDeath"
AutoBuffActivateEffect = "yorick_ult_revive_tar.troy"
AutoBuffActivateEffect2 = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IsKarthus",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IsKogMaw",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "yorick_ult_01_teamID_green.troy",
      EffectNameForOtherTeam = "yorick_ult_01_teamID_red.troy",
      Flags = 0,
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Particle4",
      EffectID2VarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "yorick_ult_02.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Particle",
      EffectID2VarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 500,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathDefied"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "IsKarthus",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "DeathDefied",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KogMawIcathianSurpriseReady"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "IsKogMaw",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KogMawIcathianSurpriseReady",
          ResetDuration = 0
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
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle4",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Expired",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsKarthus",
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
              BuffName = "DeathDefied",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 30000,
              BuffVarsTable = "NextBuffVars",
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
          Src1Var = "IsKogMaw",
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
              BuffName = "KogMawIcathianSurpriseReady",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 30000,
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
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Nothing",
          BuffName = "YorickRADelayLich"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Nothing",
              BuffName = "YorickRADelayKogMaw"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "IsKarthus",
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
                      BuffName = "DeathDefied",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 30000,
                      BuffVarsTable = "NextBuffVars",
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
                  Src1Var = "IsKogMaw",
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
                      BuffName = "KogMawIcathianSurpriseReady",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 30000,
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
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BecomeZombie",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnZombieBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "YorickUltPetActive",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Suppression}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Blind}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Poison}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_CombatDehancer}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Stun}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Invisibility}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Silence}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Taunt}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Polymorph}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Snare}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Damage}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_SpellImmunity}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_PhysicalImmunity}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Invulnerability}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Fear}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Net}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_CombatEnchancer}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsKarthus",
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
          BuffName = "YorickRADelayLich",
          BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "IsKogMaw",
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
          BuffName = "YorickRADelayKogMaw",
          BuffAddType = BUFF_RENEW_EXISTING,
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "YorickRADelay",
          BuffAddType = BUFF_RENEW_EXISTING,
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
        Function = BBForEachChampion,
        Params = {
          IteratorVar = "Unit",
          Team = TEAM_ORDER,
          BuffNameFilter = "YorickRARemovePet",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "YorickRARemovePet"
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
        Function = BBForEachChampion,
        Params = {
          IteratorVar = "Unit",
          Team = TEAM_CHAOS,
          BuffNameFilter = "YorickRARemovePet",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "YorickRARemovePet"
            }
          }
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "YorickRADelay"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_01_teamid_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_01_teamid_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickultpetactive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelaylich"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelaykogmaw"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelay"
    }
  }
}
