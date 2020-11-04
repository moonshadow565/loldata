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
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_team_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_team_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_hellvine.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_hellvine_nosound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_skin02_seed_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_skin02_seed_indicator_nosound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_death_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_w_seedtrap_trigger_hellvine.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_skin02_w_seedtrap_trigger.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_w_seedtrap_trigger.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraseedtrapvision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "zyraseed"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "zyraseed"}
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
