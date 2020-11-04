NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_fortify.dds"
BuffName = "FortifyBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "recallimproved"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinrecallimproved"
    }
  }
}
