BuffTextureName = "Sion_SpiritFeast.dds"
BuffName = "CannibalismMaxHPGained"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "CannibalismMaxHPMod",
      Src1VarTable = "CharVars",
      Src2Var = "CannibalismMaxHPMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CannibalismMaxHPMod",
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
      DeltaVar = "CannibalismMaxHPMod",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
