NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Trundle_Bite.dds"
BuffName = "TrundleTrollSmash"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_trollsmash_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundletrollsmash"
    }
  }
}
