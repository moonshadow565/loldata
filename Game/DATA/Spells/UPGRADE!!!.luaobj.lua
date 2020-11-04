NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UPGRADE!!!"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgradeslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgradebuff"
    }
  }
}
