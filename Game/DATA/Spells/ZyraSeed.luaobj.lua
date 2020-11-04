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
  "Zyra_hellvine"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_trigger_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyraseedenemytexture.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_idle_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_yordletrap_idle_red.troy"
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
      Name = "zyra_seed_indicator_team_green.troy "
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator_team_red.troy  "
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_indicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraseedcap"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_seed_death_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraexpirationtimer"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraseedtimer"
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
