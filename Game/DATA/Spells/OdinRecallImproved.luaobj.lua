NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
ChannelDuration = 4
BuffTextureName = "RecallHome.dds"
BuffName = "Recall"
SpellFXOverrideSkins = {
  "OktoberGragas"
}
SpellVOOverrideSkins = {
  "ZombieBrand"
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
