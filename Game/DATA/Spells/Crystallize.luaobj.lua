NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
SpellFXOverrideSkins = {
  "BlackIceAnivia"
}
SpellVOOverrideSkins = {
  "BlackIceAnivia"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalwallpush"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "aniviaiceblock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "crystallizeblackicemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cryo_crystalize.troy"
    }
  }
}
