NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
ChannelDuration = 7
BuffTextureName = "RecallHome.dds"
BuffName = "Recall"
SpellFXOverrideSkins = {
  "OktoberGragas",
  "MetalWingedJudicator",
  "ClericSoraka"
}
SpellVOOverrideSkins = {
  "ZombieBrand",
  "CyberNocturne"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleporthomeimproved.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleportarrive.troy"
    }
  }
}
