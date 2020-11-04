BuffTextureName = "Garen_DecisiveStrike.dds"
BuffName = "GarenFastMove"
AutoBuffActivateEffect = "garen_descisiveStrike_speed.troy"
AutoBuffActivateEffect2 = "garen_descisiveStrike_indicator.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
