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
      Name = "namiwmissileally"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namipassivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_w_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_w_tar_ally.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "namiw"}
  }
}
