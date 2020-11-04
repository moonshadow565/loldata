NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Khazix_P.dds"
BuffName = "KhazixPassive"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "KhazixSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixpdamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhatred"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixhatredrengar"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_r_evo2_charactertexture.troy"
    }
  }
}
