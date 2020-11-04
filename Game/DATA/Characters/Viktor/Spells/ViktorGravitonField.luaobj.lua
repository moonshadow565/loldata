NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
SpellToggleSlot = 4
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfielddebuffslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfielddebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_gravitonfield_deactivate_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfield"
    }
  }
}
