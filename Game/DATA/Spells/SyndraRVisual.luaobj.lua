NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "BurningAgony"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndrartimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_r_spheres_q5.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_r_spheresenemy_q5.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_r_spheres.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_r_spheresenemy.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_orbs_death_justicarally.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_orbs_death_justicarenemy.troy"
    }
  }
}
