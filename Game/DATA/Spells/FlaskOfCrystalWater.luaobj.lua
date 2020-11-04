NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2004_Mana_Potion.dds"
BuffName = "Mana Potion"
AutoBuffActivateEffect = "Global_Item_ManaPotion.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "flaskofcrystalwater"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "potion_internal"
    }
  }
}
