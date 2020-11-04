DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Tristana_headshot.dds"
BuffName = "Rapid Fire"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hatespikemaintarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkrevealeddebuff"
    }
  }
}
