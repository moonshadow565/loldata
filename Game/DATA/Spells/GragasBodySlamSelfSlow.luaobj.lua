BuffTextureName = "Nidalee_Pounce.dds"
AutoBuffActivateEffect = "Global_Slow.troy"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0
    }
  }
}
