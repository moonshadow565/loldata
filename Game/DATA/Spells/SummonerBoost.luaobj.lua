NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Summoner_boost.dds"
BuffName = "Cleanse"
AutoBuffActivateEffect = ""
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Snare,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Net,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Sleep,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Taunt,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Duration",
              Src1Value = 0,
              Src2Value = 0.35,
              DestVar = "Duration",
              MathOp = MO_MULTIPLY
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Duration",
          Src1Value = 0.3,
          Src2Value = 0,
          DestVar = "Duration",
          MathOp = MO_MAX
        }
      }
    }
  }
}
SpellUpdateTooltipBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 210
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BaseCooldown",
      Index = 2,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "defensiveMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 4,
          Index = 1,
          SlotNumber = 0,
          SlotNumberVar = "SpellSlot",
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_SUMMONER,
          TargetVar = "Attacker"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetSpellToolTipVar,
        Params = {
          Value = 3,
          Index = 1,
          SlotNumber = 0,
          SlotNumberVar = "SpellSlot",
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_SUMMONER,
          TargetVar = "Attacker"
        }
      }
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 210
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Boost.troy",
      Flags = 0,
      EffectIDVar = "BoostParticle",
      TargetObjectVar = "Target",
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
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Blind}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Silence}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Stun}
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
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Snare}
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
    Params = {TargetVar = "Owner", Type = BUFF_Blind}
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Target",
      BuffName = "SummonerExhaust"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Target",
      BuffName = "ExhaustSlow"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Target",
      BuffName = "ExhaustDebuff"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Target",
      BuffName = "SummonerDot"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "defensiveMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
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
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_boost.troy"
    }
  }
}
