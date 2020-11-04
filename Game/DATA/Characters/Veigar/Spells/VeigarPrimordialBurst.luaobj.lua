NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
SpellFXOverrideSkins = {
  "BadSantaVeigar",
  "VeigarSkin08"
}
SpellVOOverrideSkins = {
  "VeigarSkin08"
}
SetSpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "veigarprimordialburst"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "veigar_r_laugh.troy"
    }
  }
}
