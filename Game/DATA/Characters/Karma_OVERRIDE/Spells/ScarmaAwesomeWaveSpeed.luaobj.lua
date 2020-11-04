NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {"pirateRyze"}
TriggersSpellCasts = true
SetSpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "overload_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
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
