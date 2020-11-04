BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenKillBuff"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "CommandBonus",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "CommandBonus",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CommandBonus",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "TooltipBonus",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipBonus",
      Index = 1
    }
  }
}
