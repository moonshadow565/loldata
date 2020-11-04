NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Lulu_GiantGrowth.dds"
BuffName = "LuluR"
AutoBuffActivateEffect = "lulu_R_tar_buf.troy"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_r_forward.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_r_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "lulurboom"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "lulurslow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_r_expire.troy"
    }
  }
}
