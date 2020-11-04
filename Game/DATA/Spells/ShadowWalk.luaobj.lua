NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "ShadowWalk"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DefenseBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StunDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 0.1,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = -60,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0.5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Owner"}
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetStealthed
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 10
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
      Src2Var = "BaseCooldown",
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
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 1,
      fadeTime = 0.5,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DefenseBonus",
      DestVarTable = "NextBuffVars",
      SrcVar = "DefenseBonus",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveBonus",
      DestVarTable = "NextBuffVars",
      SrcVar = "MoveBonus",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ShadowWalkArmor",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  },
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
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
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
      Value2 = "Ravage",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "StunDuration",
          DestVarTable = "NextBuffVars",
          SrcVar = "StunDuration",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BreakDamage",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WasStealthed",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "HateSpike",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "StunDuration",
          DestVarTable = "NextBuffVars",
          SrcVar = "StunDuration",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BreakDamage",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WasStealthed",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "ShadowWalk",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CastingBreaksStealth",
          Src1VarTable = "SpellVars",
          Value2 = true,
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
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "CastingBreaksStealth",
          Src1VarTable = "SpellVars",
          Value2 = false,
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
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StunDuration",
      DestVarTable = "NextBuffVars",
      SrcVar = "StunDuration",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakDamage",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "WasStealthed",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "temp",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "temp",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ShadowWalk"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ShadowWalk_internal"
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
          EffectName = "evelyn_invis_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBGetTime,
        Params = {
          DestVar = "InitialTime",
          DestVarTable = "NextBuffVars"
        }
      },
      {
        Function = BBGetTime,
        Params = {
          DestVar = "TimeLastHit",
          DestVarTable = "NextBuffVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveBonus",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.1,
            0.14,
            0.18,
            0.22,
            0.26
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "StunDuration",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            1,
            1,
            1,
            1,
            1
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DefenseBonus",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0,
            0,
            0,
            0,
            0
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "StealthDuration",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            40,
            40,
            40,
            40,
            40
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ShadowWalk_internal",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
BuffOnLaunchAttackBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkarmor"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wasstealthed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "shadowwalk"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalk_internal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelyn_invis_cas.troy"
    }
  }
}
