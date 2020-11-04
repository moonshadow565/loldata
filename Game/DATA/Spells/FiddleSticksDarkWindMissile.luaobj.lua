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
      Name = "fiddlesticksdarkwindmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "darkwind"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_darkwind_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darkwind_tar.troy"
    }
  }
}
