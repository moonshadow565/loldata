NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "RendingShot_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_damacianjustice_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_damacianjustice_tar_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_damacianjustice_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garendemacianjusticevomarker"
    }
  }
}
