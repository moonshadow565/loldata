NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "SkarnerFracture.dds"
BuffName = "SkarnerFractureMissile"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_tar_consume.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerfracture"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnervirulentslashslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxpassive_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_crystal_slash_tar.troy"
    }
  }
}
