NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
ChannelDuration = 4
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
      Name = "teleporthome_shortimproved.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleportarrive.troy"
    }
  }
}
