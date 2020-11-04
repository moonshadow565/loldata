BuffTextureName = "Cardmaster_SealFate.dds"
BuffName = "Second Sight"
AutoBuffActivateEffect = ""
UpdateBuffsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CritChanceMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritChanceMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "TooltipCritChance",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipCritChance",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritChanceMod,
      TargetVar = "Owner",
      DeltaVar = "CritChanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
