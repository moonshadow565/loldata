NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "SkarnerFracture.dds"
BuffName = "SkarnerFracture"
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
      Name = "galio_bulwark_heal.troy"
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
      Name = "skarnerfracturemissile"
    }
  }
}
