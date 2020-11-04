NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gnarrknockback"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_land.troy"
    }
  }
}
