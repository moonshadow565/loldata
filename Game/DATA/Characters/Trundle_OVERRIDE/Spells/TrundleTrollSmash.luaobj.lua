NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Trundle_Q.dds"
BuffName = "TrundleTrollSmash"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_q_trollsmash_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundleqslow"
    }
  }
}
