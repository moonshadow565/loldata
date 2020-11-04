NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "BattlecastChogath"
}
SpellVOOverrideSkins = {
  "DandyChogath",
  "BattlecastChogath"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_battlecast_rupture_cas_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_battlecast_rupture_cas_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rupture_cas_01_green_team.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rupture_cas_01_red_team.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotchogathrupturepopup"
    }
  }
}
