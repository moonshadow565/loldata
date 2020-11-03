BuffTextureName = "3005_Atmas_Impaler.dds"
BuffName = "Atma's Impaler"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercHealth",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercHealth",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercMissing",
      Src1Value = 0,
      Src2Value = 2.5,
      DestVar = "Vamp",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellVampMod,
      TargetVar = "Owner",
      DeltaVar = "Vamp",
      Delta = 0
    }
  }
}
