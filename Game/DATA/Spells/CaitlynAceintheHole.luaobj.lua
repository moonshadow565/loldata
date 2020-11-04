NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1
BuffTextureName = "Caitlyn_AceintheHole.dds"
BuffName = "CaitlynAceintheHole"
AutoBuffActivateEffect = "caitlyn_ace_target_indicator.troy"
AutoBuffActivateEffect2 = "caitlyn_ace_target_indicator_02.troy"
PreLoadBuildingBlocks = {
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
      Name = "caitlyn_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
