BuffTextureName = "Heimerdinger_TechmaturgicalRepairBots.dds"
BuffName = "TechmaturgicalRepairBots"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "healthRegen",
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
      DeltaVar = "healthRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
