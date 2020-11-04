NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Quinn_E.dds"
BuffName = "QuinnERoot"
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_e_tar.troy"
    }
  }
}
