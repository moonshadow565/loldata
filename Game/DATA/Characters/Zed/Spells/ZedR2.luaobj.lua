NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "shadowninja_R2.dds"
BuffName = "ZedR2"
SpellToggleSlot = 4
SpellFXOverrideSkins = {
  "ReefMalphite",
  "GlacialMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_stormblade_cloneswap.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_base_cloneswap.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "zedult"}
  }
}
