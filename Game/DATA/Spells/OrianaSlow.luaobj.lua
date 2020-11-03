BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "OrianaDissonanceEnemy"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
AutoBuffActivateAttachBoneName = ""
PopupMessage1 = "game_floatingtext_Slowed"
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
      RequiredVar = "Level",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Target",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TicksLeft",
      DestVarTable = "InstanceVars",
      SrcValue = 8
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpeedMod",
      SrcValueByLevel = {
        -0.2,
        -0.25,
        -0.3,
        -0.35,
        -0.4
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TicksLeft",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 8,
      DestVar = "ElapsedRatio",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpeedMod",
      Src2Var = "ElapsedRatio",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalSpeed",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "TotalSpeed",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TicksLeft",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "TicksLeft",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TicksLeft",
      DestVarTable = "InstanceVars",
      SrcVar = "TicksLeft"
    }
  }
}
