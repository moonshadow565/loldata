NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "3009_Boots_of_Teleportation.dds"
BuffName = "Nimbleness"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.1
    }
  }
}
