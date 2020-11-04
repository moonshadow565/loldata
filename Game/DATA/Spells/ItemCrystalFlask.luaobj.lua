NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2041_Crystalline_Flask.dds"
BuffName = "ItemCrystalFlask"
AutoBuffActivateEffect = "potion_manaheal.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemcrystalflask"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "flask_internal"
    }
  }
}
