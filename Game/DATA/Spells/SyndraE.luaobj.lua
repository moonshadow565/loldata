NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
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
  "SyndraSkin02"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndraesound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndraemissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndraemissile3"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "syndraemissile2"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "syndra_base_e_cas.troy"
    }
  }
}
