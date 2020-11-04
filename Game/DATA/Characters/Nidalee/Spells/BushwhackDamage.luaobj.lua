NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "NIdalee_W1.dds"
BuffName = "BushwhackDamage"
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_watched.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nidaleepassivehunted"
    }
  }
}
