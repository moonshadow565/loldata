NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2010_Mini_Potion.dds"
BuffName = "Health Potion"
AutoBuffActivateEffect = "Regenerationpotion_itm.troy"
AutoBuffActivateEffect2 = "ManaPotion_itm.troy"
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
