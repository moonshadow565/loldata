NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuowmovingwallenemy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_w_windwall_big_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_w_windwall_big_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_w_windwall_small_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_w_windwall_small_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_w_windwall_ult_impact.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_w_windwall_ult_impact.troy"
    }
  }
}
