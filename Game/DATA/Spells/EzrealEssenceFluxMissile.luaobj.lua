NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "EzrealEssenceFluxDebuff"
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedModNegative",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedModNegative",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "EzrealRisingSpellForce",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        0,
        0,
        0,
        0,
        0
      },
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Target", DestVar = "CasterID2"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Ezreal_essenceflux_tar.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      BoneName = "root",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "CasterID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      SrcValue = 0,
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CasterID",
      Src2Var = "CasterID2",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Target",
          SourceVar = "Attacker"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "EzrealEssenceFlux",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
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
        Function = BBMath,
        Params = {
          Src1Var = "AttackSpeedMod",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "AttackSpeedModNegative",
          DestVarTable = "NextBuffVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            75,
            125,
            175,
            225,
            275
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.6,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "EzrealEssenceFluxMissile",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealrisingspellforce"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealessenceflux"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealessencefluxmissile"
    }
  }
}
