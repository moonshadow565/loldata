NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "pyromania"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "incinerate_buf_frost.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "incinerate_buf.troy"
    }
  }
}
