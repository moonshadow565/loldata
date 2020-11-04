BuffTextureName = "Sion_SpiritFeast.dds"
BuffName = "CannibalismMaxHPGained"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "HPGain",
      Src1VarTable = "CharVars",
      Src2Var = "HPGain",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HPGain",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HPGain",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
