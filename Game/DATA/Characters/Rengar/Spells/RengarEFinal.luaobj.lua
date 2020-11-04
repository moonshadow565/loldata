NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarmanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengareslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_base_e_tar.troy"
    }
  }
}
