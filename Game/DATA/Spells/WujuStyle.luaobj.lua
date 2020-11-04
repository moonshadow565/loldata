NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "MasterYi_SunderingStrikes.dds"
BuffName = "Wuju Style"
AutoBuffActivateEffect = "Wujustyle_buf.troy"
AutoBuffActivateAttachBoneName = "weaponstreak"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MasterYiWujuDeactivated"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "BaseDamage", SrcValue = 10}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Level",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "LevelDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LevelDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "TotalDamage",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WujuStyle"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "WujuStyleSuperCharged",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryiwujudeactivated"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "wujustyle"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wujustylesupercharged"
    }
  }
}
