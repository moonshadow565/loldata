NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffName = "TalonShadowAssault"
SpellToggleSlot = 2
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
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_ult_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_invis_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultanimbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaultmisone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonshadowassaulttoggle"
    }
  }
}
