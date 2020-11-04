NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "LeonaShieldOfDaybreak.DDS"
BuffName = "BraumDRShield"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellToggleSlot = 3
SpellFXOverrideSkins = {
  "BraumSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "braume"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "braumeshieldbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "braumemsboost"
    }
  }
}
