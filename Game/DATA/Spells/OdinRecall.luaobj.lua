NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
ChannelDuration = 4.5
BuffTextureName = "RecallHome.dds"
BuffName = "Recall"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleporthome.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleportarrive.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "odinrecall"}
  }
}
