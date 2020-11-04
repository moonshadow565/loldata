NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "LeblancConjureChainsM.dds"
BuffName = "LeblancShackleBeamM"
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
      Name = "leblanc_shackle_chain_beam_ult.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_self_idle_ult.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_target_idle_ult.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_tar_blood.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_indicator_ult.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbproc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbmproc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshacklenetm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshacklem"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
