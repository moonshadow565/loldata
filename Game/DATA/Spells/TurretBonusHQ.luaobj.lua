BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "Magical Sight"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaxIncreases",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ResistMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LoopOffset",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StartDecay",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxIncreases",
      Src2VarTable = "InstanceVars",
      Src1Value = 2.5,
      Src2Value = 0,
      DestVar = "MaximumArmor",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxIncreases",
      Src2VarTable = "InstanceVars",
      Src1Value = 2.5,
      Src2Value = 0,
      DestVar = "MaximumResist",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MaxIncreases",
      Src2VarTable = "InstanceVars",
      Src1Value = 7,
      Src2Value = 0,
      DestVar = "MaximumDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 800,
      TargetVar = "Owner",
      Duration = 25000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "ThisBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_CHAOS,
          ConnectedFromStart = true,
          IncludeBots = true,
          DestVar = "NumChampions"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetNumberOfHeroesOnTeam,
        Params = {
          Team = TEAM_ORDER,
          ConnectedFromStart = true,
          IncludeBots = true,
          DestVar = "NumChampions"
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "NumChampions",
      Src1Value = 5,
      Src2Value = 0,
      DestVar = "NumChampions",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "NumChampions",
      Src1Value = 0,
      Src2Value = 150,
      DestVar = "BonusHealth",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Looper",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "ThisBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ResistMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 60,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Looper",
          Src1VarTable = "InstanceVars",
          Src2Var = "StartDecay",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "ArmorMod",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 5,
              DestVar = "ArmorMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ResistMod",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 5,
              DestVar = "ResistMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Looper",
          Src1VarTable = "InstanceVars",
          Src2Var = "LoopOffset",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "ArmorMod",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 2.5,
              DestVar = "ArmorMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ResistMod",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 2.5,
              DestVar = "ResistMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageMod",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 7,
              DestVar = "DamageMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageMod",
              Src1VarTable = "InstanceVars",
              Src2Var = "MaximumDamage",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ArmorMod",
              Src1VarTable = "InstanceVars",
              Src2Var = "MaximumArmor",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ArmorMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "ResistMod",
              Src1VarTable = "InstanceVars",
              Src2Var = "MaximumResist",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ResistMod",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "Looper",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Looper",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "Looper",
              Src2VarTable = "InstanceVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Looper",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "BonusHealth",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
