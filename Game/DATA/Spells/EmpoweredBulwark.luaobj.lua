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
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "HealthMod",
      Delta = 0
    }
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
