BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "ShadowWalkSpeed"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "WalkSpeed",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
