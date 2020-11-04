BuffTextureName = "Soraka_Consecration.dds"
BuffName = "Consecration"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = 16
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = -16
    }
  }
}
