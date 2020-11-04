BuffTextureName = "BlindMonk_SightUnseeing.dds"
BuffName = "Blind"
AutoBuffActivateEffect = "Global_miss.troy"
AutoBuffActivateAttachBoneName = "head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MissChance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMissChanceMod,
      TargetVar = "Owner",
      DeltaVar = "MissChance",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
