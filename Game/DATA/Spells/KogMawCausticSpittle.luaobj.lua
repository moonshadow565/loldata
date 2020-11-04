NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KogMaw_CausticSpittle.dds"
BuffName = "KogMawCausticSpittle"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPen",
      SrcValue = 0,
      SrcValueByLevel = {
        0.13,
        0.16,
        0.19,
        0.22,
        0.25
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorPen",
      Delta = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPen2",
      SrcValue = 0,
      SrcValueByLevel = {
        13,
        16,
        19,
        22,
        25
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ArmorPen2",
      Index = 1
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KogMawCausticSpittle"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "KogMawCausticSpittleCharged",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        60,
        110,
        160,
        210,
        260
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.7,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawcausticspittle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawcausticspittlecharged"
    }
  }
}
