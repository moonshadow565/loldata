NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Irelia_TranscendentBladesReady.dds"
BuffName = "IreliaTranscendentBlades"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Blades",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "NewCd",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Location,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = -100,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "IreliaIdleParticle"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "IreliaTeamID"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "irelia_ult_magic_resist.troy",
      Flags = 0,
      EffectIDVar = "UltMagicParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "IreliaTeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Irelia_ult_dagger_active_04.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_DAGGER1",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "IreliaTeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Irelia_ult_dagger_active_04.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_DAGGER2",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "IreliaTeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Irelia_ult_dagger_active_04.troy",
      Flags = 0,
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_DAGGER4",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "IreliaTeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Irelia_ult_dagger_active_04.troy",
      Flags = 0,
      EffectIDVar = "Particle4",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_DAGGER5",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "IreliaTeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "UltMagicParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_SelfAOE,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Blades",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Blades",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle1",
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
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Blades",
      Src1VarTable = "InstanceVars",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle1",
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
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Blades",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle1",
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
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Particle4",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "IreliaIdleParticle",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "NewCd",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 3,
      OwnerVar = "Owner"
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "IreliaTranscendentBlades",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Blades",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "Blades",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "IreliaTranscendentBladesSpell"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle4",
              EffectIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle3",
              EffectIDVarTable = "InstanceVars"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle1",
              EffectIDVarTable = "InstanceVars"
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "IreliaTranscendentBladesSpell"
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "Level", Info = GetCastSpellLevelPlusOne}
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
        Function = BBDistanceBetweenPoints,
        Params = {
          DestVar = "Distance",
          Point1Var = "OwnerPos",
          Point2Var = "TargetPos"
        }
      },
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "IreliaTranscendentBladesSpell"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "TargetPos",
          EndPosVar = "TargetPos",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.5,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "IreliaTranscendentBladesSpell"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 1,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "IreliaTranscendentBlades"
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NewCd",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            60,
            50,
            40,
            0,
            0
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Blades",
          DestVarTable = "NextBuffVars",
          SrcValue = 4
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "IreliaTranscendentBlades",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            10,
            10,
            10
          },
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "IreliaTranscendentBladesSpell",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 4,
          NumberOfStacks = 4,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UnlockAnimation",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell4",
          ScaleTime = 1.5,
          TargetVar = "Owner",
          Loop = false,
          Blend = true
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.25,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliaidleparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_ult_magic_resist.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_ult_dagger_active_04.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliatranscendentbladesspell"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliatranscendentblades"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
