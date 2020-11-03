NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sion_Cannibalism.dds"
AutoBuffActivateEffect = "Cannibalism_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cannibalism"
    }
  }
}
