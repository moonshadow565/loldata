NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Trundle_Q.dds"
BuffName = "TrundleTrollSmash"
SpellVOOverrideSkins = {
  "ClassicTrundle"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_trundle_q_ampedq.troy"
    }
  },
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
