BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "JudicatorHolyFervorDebuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "SubjectArmor",
      Src1Value = -0.03,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "armorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatSpellBlockMod,
      TargetVar = "Owner",
      DestVar = "SubjectMR"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "SubjectMR",
      Src1Value = -0.03,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "mrInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "armorInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "mrInc",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "SubjectArmor"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SubjectArmor",
      Src2Var = "armorInc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SubjectArmor",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "SubjectArmor",
      Src1Value = -0.03,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "armorInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "armorInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBGetSpellBlock,
    Params = {TargetVar = "Owner", DestVar = "SubjectMR"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SubjectMR",
      Src2Var = "mrInc",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SubjectMR",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "SubjectMR",
      Src1Value = -0.03,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "mrInc",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "mrInc",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
