NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_fortify.dds"
BuffName = "FortifyBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = 55
    }
  }
}
