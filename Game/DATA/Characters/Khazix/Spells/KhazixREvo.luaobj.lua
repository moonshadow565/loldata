NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Khazix_R_red.dds"
BuffName = "KhazixREvo"
AutoBuffActivateEffect = "Khazix_Stealth_Evolved_Texture.troy"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_r_evo2_charactertexture.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixpdamage"
    }
  }
}
