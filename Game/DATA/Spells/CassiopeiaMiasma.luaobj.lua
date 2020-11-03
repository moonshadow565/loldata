NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect = "AcidTrail_buf.troy"
AutoBuffActivateAttachBoneName = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassmiasma_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassmiasma_tar_red.troy"
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
