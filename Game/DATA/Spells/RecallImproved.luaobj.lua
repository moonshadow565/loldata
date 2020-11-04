NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
ChannelDuration = 7
BuffTextureName = "RecallHome.dds"
BuffName = "Recall"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleporthomeimproved.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "recall"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleportarrive.troy"
    }
  }
}
