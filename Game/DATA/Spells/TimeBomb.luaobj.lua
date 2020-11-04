NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Chronoblast.dds"
BuffName = "Time Bomb"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebomb_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebomb_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebombexplo.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "timebombcountdown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "timebomb"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "zilean"}
  }
}
