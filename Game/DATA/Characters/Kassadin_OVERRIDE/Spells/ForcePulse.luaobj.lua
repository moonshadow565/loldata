NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "forcepulsecounter"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kassadin_base_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
