NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
AutoBuffActivateEffect = "RunePrison_tar.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cryo_storm.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "glacialstorm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  }
}
