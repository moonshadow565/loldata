NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "XerathArcaneBarrage2"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "IronForgeXerath"
}
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
    Function = BBPreloadSpell,
    Params = {
      Name = "ascxeratharcanebarragedamaged"
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
