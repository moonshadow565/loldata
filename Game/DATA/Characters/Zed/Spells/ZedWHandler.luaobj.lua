NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "2.dds"
BuffName = "ZedWHandler"
SpellToggleSlot = 2
SpellFXOverrideSkins = {
  "ReefMalphite",
  "GlacialMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "zedw2"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianaballindicatornear.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zedshadowdash"
    }
  }
}
