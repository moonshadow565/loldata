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
      DestVar = "ManaMod",
      SrcValueByLevel = {
        4,
        8,
        12,
        16
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Energy",
      SrcValueByLevel = {
        4,
        7,
        10,
        10
      }
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "CharLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaMod",
      Src2Var = "CharLevel",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Mana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncFlatPARPoolMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "Mana",
      Delta = 0
    }
  },
  {
    Function = BBIncFlatPARPoolMod,
    Params = {
      PARType = PAR_ENERGY,
      TargetVar = "Owner",
      DeltaVar = "Energy",
      Delta = 0
    }
  }
}
