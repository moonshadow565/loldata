NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "BlindMonkEOne.dds"
BuffName = "BlindMonkTempest"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellFXOverrideSkins = {
  "ReefMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_thundercrash_impact_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_thundercrash_impact_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_e_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_thundercrash_impact_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_e_thundercrash_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_e_thundercrash_unit_tar_blood.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkemanager"
    }
  }
}
