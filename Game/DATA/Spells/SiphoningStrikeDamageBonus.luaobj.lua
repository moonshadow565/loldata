BuffTextureName = "Sion_SpiritFeast.dds"
BuffName = "CannibalismMaxHPGained"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageBonus",
      Src1VarTable = "CharVars",
      Src2Var = "DamageBonus",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageBonus",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  }
}
