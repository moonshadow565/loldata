NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = ""
BuffName = "SonaHymnofValorSound"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasoundoff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonahymnofvalorsound.troy"
    }
  }
}
