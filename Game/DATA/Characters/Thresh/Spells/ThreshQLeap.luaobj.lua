NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ahri_Charm.dds"
BuffName = "AhriSeduce"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursebandages.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqleapattack"
    }
  }
}
