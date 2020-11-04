NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "EzrealEssenceFluxDebuff"
TriggersSpellCasts = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValue = 0,
      SrcValueByLevel = {
        50,
        75,
        100,
        125,
        150
      }
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
      Src2Value = 0.4,
      DestVar = "AbilityPowerMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPowerMod",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SilenceDuration",
      SrcValue = 0,
      SrcValueByLevel = {
        1.4,
        1.8,
        2.2,
        2.6,
        3
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "TotalDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Silence",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Silence,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "SilenceDuration",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "silence"}
  }
}
