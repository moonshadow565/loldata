NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Galio_RighteousGust.dds"
BuffName = "BraumDRShieldReturn"
SpellToggleSlot = 1
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vi_e_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumdrshield"
    }
  }
}
