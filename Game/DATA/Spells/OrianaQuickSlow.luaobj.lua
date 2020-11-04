BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "Slow"
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
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "StartTime",
      SecondsVarTable = "InstanceVars"
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
        -0.3,
        -0.4,
        -0.5
      }
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "CurrentTime"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentTime",
      Src2Var = "StartTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ElapsedTime",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ElapsedTime",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "ElapsedTime",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ElapsedTime",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "ElapsedRatio",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ElapsedRatio",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ElapsedRatio",
      MathOp = MO_MAX
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
  }
}
