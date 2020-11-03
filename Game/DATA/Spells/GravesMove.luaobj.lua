NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Shen_ShadowDash.dds"
BuffName = "Shen Shadow Dash"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "graves_move_onbuffactivate.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravesmovesteroid"
    }
  }
}
