NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Khazix_Q_red.dds"
BuffName = "KhazixQEvo"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "KhazixDroid",
  "KhazixSkin02"
}
SpellVOOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixpdamage"
    }
  }
}
