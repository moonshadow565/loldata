NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Nasus_Wither.dds"
BuffName = "Wither"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
AutoBuffActivateEffect2 = "nassus_wither_tar.troy"
AutoBuffActivateEffect3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1.05,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "SpeedMod",
          Src1VarTable = "InstanceVars",
          Src2Var = "BonusSpeedMod",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "SpeedMod",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.32,
        -0.32,
        -0.32,
        -0.32,
        -0.32
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.04,
        -0.08,
        -0.12,
        -0.16,
        -0.2
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        5,
        5,
        5,
        5,
        5
      },
      TickRate = 0
    }
  }
}
