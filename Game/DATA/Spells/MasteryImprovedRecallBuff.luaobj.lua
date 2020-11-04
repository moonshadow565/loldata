NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_fortify.dds"
BuffName = "FortifyBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
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
