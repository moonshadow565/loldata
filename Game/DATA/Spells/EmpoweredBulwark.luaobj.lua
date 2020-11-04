BuffTextureName = "ChemicalMan_EmpoweredBulwark.dds"
BuffName = "Empowered Bulwark"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "TempMana",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "HealthMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Value = 0,
      Src2Value = 2.5,
      DestVar = "HealthIncRate",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HealthMod",
      Delta = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealthMod",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealthIncRate",
      Index = 2
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 10, Index = 3}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  }
}
