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
      Name = "Quinn_Base_E_End.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "quinnebump"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "quinneroot"}
  }
}
