NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_W.dds"
BuffName = "SivirW"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sivirw"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirwmarker"
    }
  }
}
