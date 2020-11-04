NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "GreenTerror_Feast.dds"
BuffName = "Feast"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "DandyChogath"
}
SpellVOOverrideSkins = {
  "DandyChogath"
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Feast"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerStack",
      SrcValueByLevel = {
        90,
        120,
        150
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthPerStack",
      Src2Var = "Count",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusHealth",
      Index = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Feast"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerStack",
      SrcValueByLevel = {
        90,
        120,
        150
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthPerStack",
      Src2Var = "Count",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusHealth",
      Index = 1
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Feast"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerStack",
      SrcValueByLevel = {
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FeastBase",
          SrcValueByLevel = {
            300,
            550,
            800
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
          DestVar = "FeastBase",
          SrcValueByLevel = {
            1000,
            1000,
            1000
          }
        }
      }
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
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "HalfAbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HalfAbilityPower",
      Src2Var = "FeastBase",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FeastHealth",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TargetHealth",
      OwnerVar = "Target",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FeastHealth",
      Src2Var = "TargetHealth",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "TargetHealth",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "chogath_feast_sign.troy",
          Flags = 0,
          EffectIDVar = "SmokeBomb",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Feast",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 6,
          NumberOfStacks = 1,
          Duration = 30000,
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
          BuffName = "Feast_internal",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 30000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "FeastHealth",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
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
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Feast"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthPerStack",
      SrcValueByLevel = {
        90,
        120,
        150
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthPerStack",
      Src2Var = "Count",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusHealth",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "feast"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_feast_sign.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "feast_internal"
    }
  }
}
