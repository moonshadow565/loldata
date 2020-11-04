BuffTextureName = "AkaliTwilightShroud.dds"
BuffName = "AkaliTwilightShroudBuff"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
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
      DestVar = "ArmorIncrease",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        10,
        20,
        30,
        40,
        50
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
