BuffTextureName = "3138_Leviathan.dds"
BuffName = "LeviathanAura"
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageAmount",
      Src1Value = 0.85,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
