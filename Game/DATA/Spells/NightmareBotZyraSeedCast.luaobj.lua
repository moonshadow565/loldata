NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
PersistsThroughDeath = true
ChainMissileParameters = {
  MaximumHits = {
    10,
    10,
    10,
    10,
    10
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
SpellFXOverrideSkins = {
  "Zyra_hellvine",
  "ZyraSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "zyraseed"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "zyraseed"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotzyraseedbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_w_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_w_cas_02.troy"
    }
  }
}
