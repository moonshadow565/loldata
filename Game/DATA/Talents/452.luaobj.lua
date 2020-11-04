UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RegenPercent",
      SrcValueByLevel = {
        0.004,
        0.007,
        0.01
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxMana",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "RegenPercent",
      Src2Var = "MaxMana",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Regen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Regen",
      Src1Value = 0,
      Src2Value = 5,
      DestVar = "Regen",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "Regen",
      Delta = 0
    }
  }
}
