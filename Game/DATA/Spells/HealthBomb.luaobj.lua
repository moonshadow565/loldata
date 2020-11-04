NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Chronoblast.dds"
BuffName = "HealthBomb"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_supportbomb.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_supportshield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_supportdetonate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_supportdetonatehit.troy"
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
    Params = {Name = "healthbomb"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebombexplo.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_barrier_activate.troy"
    }
  }
}
