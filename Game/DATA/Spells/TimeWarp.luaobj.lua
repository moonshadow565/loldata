NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Chronokeeper_Haste.dds"
BuffName = "Time Warp"
AutoBuffActivateEffect = "ChronoClockFast_tar.troy"
AutoBuffActivateEffect2 = "Global_Haste.troy"
OnBuffActivateBuildingBlocks = {
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
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_SAME_TEAM
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValue = 0.55
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            2.5,
            3.25,
            4,
            4.75,
            5.5
          },
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AttackSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValue = -0.55
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Slow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            2.5,
            3.25,
            4,
            4.75,
            5.5
          },
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
