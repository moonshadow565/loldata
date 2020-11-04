NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
SpellDamageRatio = 0.5
SpellFXOverrideSkins = {
  "BattlecastUrgot"
}
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "urgotslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotentropypassive"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotheatseekingmissile_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotheatseekingmissile_battlecast_tar.troy"
    }
  }
}
