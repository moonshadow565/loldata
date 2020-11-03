NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UPGRADE!!!"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
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
