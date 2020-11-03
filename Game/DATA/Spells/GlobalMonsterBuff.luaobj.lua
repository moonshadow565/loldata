NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "spawnTime",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "healthPerMinute",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "damagePerMinute",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "goldPerMinute",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "expPerMinute",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "upgradeTimer",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "gameTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "gameTime",
      Src2Var = "spawnTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "jungleLifeTime",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "jungleLifeTime",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "jungleLifeTime",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "jungleLifeTime",
      Src2Var = "healthPerMinute",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "bonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "bonusHealth",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "bonusHealth",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "jungleLifeTime",
      Src2Var = "damagePerMinute",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "bonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "bonusDamage",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "bonusDamage",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "jungleLifeTime",
      Src2Var = "goldPerMinute",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "bonusGold",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "bonusGold",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "bonusGold",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "jungleLifeTime",
      Src2Var = "expPerMinute",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "bonusExp",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "bonusExp",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "bonusExp",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "bonusHealth",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "bonusDamage",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentExpReward,
    Params = {
      TargetVar = "Owner",
      DeltaVar = "bonusExp",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentGoldReward,
    Params = {
      TargetVar = "Owner",
      DeltaVar = "bonusGold",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "healthPercent",
      Value2 = 0.995,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "upgradeTimer",
          Src1VarTable = "InstanceVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
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
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatHPPoolMod,
                  TargetVar = "Owner",
                  DeltaVar = "healthPerMinute",
                  DeltaVarTable = "InstanceVars",
                  Delta = 0
                }
              },
              {
                Function = BBIncPermanentStat,
                Params = {
                  Stat = IncPermanentFlatPhysicalDamageMod,
                  TargetVar = "Owner",
                  DeltaVar = "damagePerMinute",
                  DeltaVarTable = "InstanceVars",
                  Delta = 0
                }
              },
              {
                Function = BBIncPermanentExpReward,
                Params = {
                  TargetVar = "Owner",
                  DeltaVar = "expPerMinute",
                  DeltaVarTable = "InstanceVars",
                  Delta = 0
                }
              },
              {
                Function = BBIncPermanentGoldReward,
                Params = {
                  TargetVar = "Owner",
                  DeltaVar = "goldPerMinute",
                  DeltaVarTable = "InstanceVars",
                  Delta = 0
                }
              }
            }
          }
        }
      }
    }
  }
}
