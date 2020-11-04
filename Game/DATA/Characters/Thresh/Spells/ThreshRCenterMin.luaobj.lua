NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoCooldownByLevel = {
  24,
  22,
  20,
  18,
  16
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Threshrvinside"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Threshrvoutside"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Threshrvmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_green_cas_leprechaun.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_red_cas_leprechaun.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_green_cas_daper.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_red_cas_daper.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_desecrate_red_cas.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  }
}
