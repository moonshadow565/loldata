NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2009_Mini_Pot.dds"
BuffName = "ItemMiniRegenPotion"
AutoBuffActivateEffect = "GLOBAL_Item_HealthPotion.troy"
AutoBuffActivateEffect2 = "GLOBAL_Item_ManaPotion.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemminiregenpotion"
    }
  }
}
