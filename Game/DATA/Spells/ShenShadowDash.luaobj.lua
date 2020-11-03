NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Shen_ShadowDash.dds"
BuffName = "Shen Shadow Dash"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenshadowdashcooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_shadowdash_mis.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_shadowdash_unit_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenshadowdashpassive"
    }
  }
}
