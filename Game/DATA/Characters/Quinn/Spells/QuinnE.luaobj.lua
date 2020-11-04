NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Quinn_E.dds"
BuffName = "QuinnE"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "PhoenixQuinn"
}
AutoBuffActivateEvent = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_r_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "quinnetarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "quinnesecond"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_e_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "quinneroot"}
  }
}
