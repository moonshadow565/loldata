BuffTextureName = "Cardmaster_SealFate.dds"
BuffName = "Second Sight"
AutoBuffActivateEffect = ""
UpdateBuffsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIncGold,
    Params = {TargetVar = "Owner", Delta = 2}
  }
}
