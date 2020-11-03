NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Annie_GhastlyShield.dds"
BuffName = "Molten Shield"
AutoBuffActivateEffect = "GhastlyShield_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "anniesparks.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  }
}
