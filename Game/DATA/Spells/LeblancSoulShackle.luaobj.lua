NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "LeblancConjureChains.dds"
BuffName = "LeblancShackleBeam"
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_chain_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_self_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_target_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_tar_blood.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshacklenet"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshackle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
