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
  "SyndraJusticar",
  "lissandraSkin02"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lissandra_base_w_nova.troy"
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
