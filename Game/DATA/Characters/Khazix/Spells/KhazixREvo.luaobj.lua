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
  "KhazixDroid"
}
SpellVOOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Khazix_Base_R_Evo2_CharacterTexture.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixpdamage"
    }
  }
}
