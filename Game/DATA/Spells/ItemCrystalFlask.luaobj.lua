NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "2048_Ichor_of_Illumination.dds"
BuffName = "ItemCrystalFlask"
AutoBuffActivateEffect = "env_manaheal.troy"
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
