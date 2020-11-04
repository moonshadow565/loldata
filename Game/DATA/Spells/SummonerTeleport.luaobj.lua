NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "Summoner_teleport.dds"
BuffName = "Teleport"
SpellFXOverrideSkins = {
  "OktoberGragas"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_teleport.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleportcancel"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_teleportarrive.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerteleport"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_turret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_target"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_deathremoval"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "destealth"}
  }
}
