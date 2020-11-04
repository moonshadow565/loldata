BuffTextureName = "Sivir_Sprint.dds"
BuffName = "SivirPassiveSpeed"
AutoBuffActivateEffect = "Sivir_PassiveHaste.troy"
AutoBuffActivateAttachBoneName = "spine"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 50
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 50
    }
  }
}
