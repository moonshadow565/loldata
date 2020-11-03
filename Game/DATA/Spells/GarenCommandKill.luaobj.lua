NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenCommandKill"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenkillbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garencommandkill"
    }
  }
}
