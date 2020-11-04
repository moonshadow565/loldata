NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jester_DeathWard.dds"
BuffName = "H28GEvolutionTurret"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "lastAttackTime",
      SecondsVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Duration = 25
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "retaunts",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {TargetVar = "Owner", BuffName = "Taunt"}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Attacker",
      DestVar = "targetable",
      Status = GetTargetable
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 625,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "targetable",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBGetGameTime,
    Params = {SecondsVar = "curTime"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "curTime",
      Src2Var = "lastAttackTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "timeElapsed",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "timeElapsed",
      Value2 = 0.75,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "retaunts",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 250
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "retaunts",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "retaunts",
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
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "lastAttackTime",
      SecondsVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  }
}
