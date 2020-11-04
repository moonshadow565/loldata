NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Janna_HowlingGale.dds"
BuffName = "Howling Gale"
SpellToggleSlot = 1
PersistsThroughDeath = true
SpellVOOverrideSkins = {
  "JannaForecast"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "howlinggale_frost_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "howlinggale_cas.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
