NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Annie_E.dds"
BuffName = "Molten Shield"
AutoBuffActivateEffect = "Annie_E_buf.troy"
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
