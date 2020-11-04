NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
BuffName = "BlindMonkSafeguard"
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_w_cas_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwonedash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwmanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "destealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkwoneshield"
    }
  }
}
