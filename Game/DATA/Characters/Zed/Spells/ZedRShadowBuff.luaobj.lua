NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "2.dds"
BuffName = "heal"
AutoBuffActivateEffect = "Zed_Clone_Idle.troy"
AutoBuffActivateAttachBoneName = "Buffbone_glb_ground_loc"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_stormblade_clonedeath.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_base_clonedeath.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_shadowindicatornearbloop.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_clone_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_clone_enemy_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_shadowindicatormed.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zed_shadowindicatorfar.troy"
    }
  }
}
