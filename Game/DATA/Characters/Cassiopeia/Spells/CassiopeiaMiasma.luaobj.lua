NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect = "AcidTrail_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassiopeia_base_w_miasma_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassiopeia_base_w_miasma_tar_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cassiopeiamiasmapoison"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
