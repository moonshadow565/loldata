NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "XerathArcaneBarrage2"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_w_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_w_aoe_explosion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathwslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_w_tar_directhit.troy"
    }
  }
}
