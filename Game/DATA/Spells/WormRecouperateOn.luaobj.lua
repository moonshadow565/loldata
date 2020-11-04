NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "3011_Dawnseeker.dds"
BuffName = "WormRecouperateOn"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wormrecoupdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wormrecouperate1"
    }
  }
}
