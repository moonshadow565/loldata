NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "LeblancConjureChains.dds"
BuffName = "LeblancShackleBeam"
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_mis_tar_submarine.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_mis_tar_terranian.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_mis_tar_base.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_impact_enemy_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_impact_terrain_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_mis_tar_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_dusttrail.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_impact_miss_terranian.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_impact_miss_submarine.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilus_q_impact_miss.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusanchordragglobalroot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusanchordragroot"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilusqimpact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusminorknockaway"
    }
  }
}
