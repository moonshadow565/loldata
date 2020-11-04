NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_E_Gold.dds"
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona", "PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonae"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaepassivecheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaezone"}
  }
}
