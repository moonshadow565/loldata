NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "SkarnerEnergize.dds"
BuffName = "SkarnerPassiveAttack"
IsDeathRecapSource = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_tar_consume.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_base_passive_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerpassivestun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerpassivecooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_heal.troy"
    }
  }
}
