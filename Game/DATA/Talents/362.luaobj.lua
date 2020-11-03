UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HP",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HP",
      Src1Value = 0,
      Src2Value = 0.03,
      DestVar = "PlusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncMaxHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "PlusHealth",
      IncCurrentHealth = false
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {
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
      DestVar = "MasteryJuggernaut",
      DestVarTable = "AvatarVars",
      SrcValue = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masteryjuggernautbuff"
    }
  }
}
