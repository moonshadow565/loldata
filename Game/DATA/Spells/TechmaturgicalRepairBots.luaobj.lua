BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "TechmaturgicalRepairBots"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealthRegenIncrease",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "HealthRegenIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
