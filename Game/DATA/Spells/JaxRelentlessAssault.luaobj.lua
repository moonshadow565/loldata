NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armsmaster_CoupDeGrace.dds"
BuffName = "JaxRelentlessAssault"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessassaultas"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessassaultdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaxrelentlessassaultspeed"
    }
  }
}
