NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SyndraJusticar"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Lissandra_Base_W_Nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandrawfrozen"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lissandrawrootmissile"
    }
  }
}
