NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1
BuffTextureName = "Caitlyn_AceintheHole.dds"
BuffName = "CaitlynAceintheHole"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_Base_ace_Target_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_Base_ace_Target_indicator_02.troy"
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
      Name = "caitlyn_Base_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
