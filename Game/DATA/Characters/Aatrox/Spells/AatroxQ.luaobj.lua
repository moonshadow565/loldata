NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_Q.dds"
BuffName = "AatroxQ"
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "AatroxSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatroxq_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatroxq_tar_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatroxq_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxqdescent"
    }
  }
}
