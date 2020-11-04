NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffName = "XenZhaoSweep"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_yasuo_e_cantcast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuordummyspell"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuorknockupcombo"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuorcantcastsound"
    }
  }
}
