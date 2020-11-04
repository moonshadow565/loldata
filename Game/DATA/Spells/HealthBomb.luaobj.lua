NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Chronoblast.dds"
BuffName = "HealthBomb"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_bomb.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_bomb_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_shield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_shield_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_detonate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_detonate_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_supportdetonatehit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_item_fom_hit_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "timebombcountdown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "healthbomb"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebombexplo.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_barrier_activate.troy"
    }
  }
}
