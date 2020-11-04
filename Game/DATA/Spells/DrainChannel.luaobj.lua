NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 5
BuffTextureName = "Fiddlesticks_ConjureScarecrow.dds"
BuffName = "Drain"
AutoBuffActivateEffect = ""
ChannelingStartBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Damage,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
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
      BuffName = "Fearmonger_marker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Heal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
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
      EffectName = "Drain.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
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
    Function = BBGetTime,
    Params = {
      DestVar = "DrainExecuted",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainPercent",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.6,
        0.65,
        0.7,
        0.75,
        0.8
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainedBool",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GlobalDrain",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        30,
        45,
        60,
        75,
        90
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.225,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "FiddlesticksSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FiddlesticksSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "Party_DrainGlow.troy",
          Flags = 0,
          EffectIDVar = "Glow",
          EffectIDVarTable = "InstanceVars",
          BoneName = "spine",
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
          BindObjectVar = "Attacker",
          EffectName = "Party_HornConfetti.troy",
          Flags = 0,
          EffectIDVar = "Confetti",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_HORN",
          TargetObjectVar = "Attacker",
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
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "DrainExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Target",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 650,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBStopChanneling,
            Params = {
              CasterVar = "Owner",
              StopCondition = ChannelingStopCondition_Cancel,
              StopSource = ChannelingStopSource_LostTarget
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSpellEffectRemove,
                Params = {
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 1,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DrainPercent",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    0.6,
                    0.65,
                    0.7,
                    0.75,
                    0.8
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DrainedBool",
                  DestVarTable = "NextBuffVars",
                  SrcValue = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "GlobalDrain",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.01,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatMagicDamageMod,
                  TargetVar = "Owner",
                  DestVar = "AbilityPower"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    30,
                    45,
                    60,
                    75,
                    90
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AbilityPower",
                  Src1Value = 0,
                  Src2Value = 0.225,
                  DestVar = "BonusDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BonusDamage",
                  Src2Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageToDeal",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
                  PercentOfAttack = 1,
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
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "Drain",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Fearmonger_marker",
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "FiddlesticksSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FiddlesticksSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Glow",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Confetti",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "Drain",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Fearmonger_marker",
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "FiddlesticksSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FiddlesticksSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Glow",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Confetti",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fearmonger_marker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {Name = "drain.troy"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_drainglow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_hornconfetti.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "drain"}
  }
}
