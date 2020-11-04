BuffTextureName = "Summoner_rally.dds"
BuffName = "VanguardBuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Attacker", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "OwnerLevel",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "DefenseMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DefenseMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "DefenseMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "DefenseMod",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
