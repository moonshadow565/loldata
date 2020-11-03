NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "spellfluxmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "spellflux"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "desperatepower_aoe.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "manaleach_tar.troy"
    }
  }
}
