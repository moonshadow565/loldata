NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1
BuffTextureName = "Caitlyn_AceintheHole.dds"
BuffName = "CaitlynAceintheHole"
SpellFXOverrideSkins = {
  "CaitlynSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_ace_target_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_ace_target_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynaceintheholevisibility"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynaceinthehole"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_skin06_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
