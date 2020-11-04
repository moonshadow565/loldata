NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
ChannelDuration = 3
BuffTextureName = "Shen_StandUnited.dds"
BuffName = "Shen Stand United Channel"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shenteleport_v2.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenstandunitedshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenstandunitedtarget"
    }
  }
}
