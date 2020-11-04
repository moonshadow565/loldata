NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2003_Health_Potion.dds"
BuffName = "Health Potion"
AutoBuffActivateEffect = "Global_Item_HealthPotion.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "regenerationpotion"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "potion_internal"
    }
  }
}
