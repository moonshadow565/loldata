NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_GlacialStorm.dds"
BuffName = "GlacialStorm"
SpellToggleSlot = 4
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_catalyst_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfield"
    }
  }
}
