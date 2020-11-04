NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotterrorcapacitoractive2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "urgotslow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bloodslash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotheatseekingmissile_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotentropypassive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
