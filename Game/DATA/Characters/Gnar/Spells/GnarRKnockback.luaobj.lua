NotSingleTargetSpell = false
DoesntBreakShields = False
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "GnarBig_R.dds"
BuffName = "GnarRKnockback"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_trail.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_e_terrain_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_land_wall.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_shieldofdaybreak_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gnar_base_r_land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_jinx_r_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
