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
      Name = "gnarbigiscasting"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_q_boomerang_end_point.troy"
    }
  }
}
