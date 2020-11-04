BuffTextureName = "OlafBerserkerRage.dds"
BuffName = "OlafBerzerkerRage"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPerc",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "HealthPerc",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "ASPerc",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "ASPerc",
      Delta = 0
    }
  }
}
