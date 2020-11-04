BuffTextureName = "Sion_SpiritFeast.dds"
BuffName = "Entropy"
PersistsThroughDeath = true
NonDispellable = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "APGain",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "APGain",
      Src1VarTable = "CharVars",
      Src2Var = "APGain",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "APGain",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APGain",
      DeltaVarTable = "CharVars",
      Delta = 0
    }
  }
}
