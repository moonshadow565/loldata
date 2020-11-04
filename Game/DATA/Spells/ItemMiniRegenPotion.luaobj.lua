NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2009_Mini_Pot.dds"
BuffName = "ItemMiniRegenPotion"
AutoBuffActivateEffect = "Global_Item_HealthPotion.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemminiregenpotion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "potion_internal"
    }
  }
}
