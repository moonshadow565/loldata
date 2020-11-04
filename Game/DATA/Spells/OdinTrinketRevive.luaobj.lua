NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffName = "OdinTrinketRevive"
AutoBuffActivateEffect = "global_ss_revive.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_ss_revive.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerrevivespeedboost"
    }
  }
}
