NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "Sion_DeathsCaress.dds"
BuffName = "Death's Caress"
AutoBuffActivateEffect = "DeathsCaress_buf.troy"
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathscaress"
    }
  }
}
