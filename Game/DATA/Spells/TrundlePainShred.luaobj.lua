BuffTextureName = "Trundle_Agony.dds"
BuffName = "TrundlePainShred"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Survivability",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetArmor,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerArmor",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSpellBlock,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerMR",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Survivability",
      Src1VarTable = "InstanceVars",
      Src2Var = "OwnerArmor",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LowerArmor",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Survivability",
      Src1VarTable = "InstanceVars",
      Src2Var = "OwnerMR",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "LowerMR",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Survivability",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 6,
      DestVar = "Survivability",
      DestVarTable = "InstanceVars",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LowerArmor",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "InstancedArmor",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LowerMR",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "InstancedMR",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "InstancedArmor",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "InstancedArmor",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "InstancedArmor",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "InstancedMR",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "InstancedMR",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "InstancedMR",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "TrundlePainBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "InstancedArmor",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "InstancedArmor",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "InstancedMR",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "InstancedMR",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "InstancedArmor",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "TrundleArmor",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "InstancedMR",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "TrundleMR",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TrundleArmor",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatArmorMod,
          TargetVar = "Attacker",
          DeltaVar = "TrundleArmor",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TrundleMR",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Attacker",
          DeltaVar = "TrundleMR",
          Delta = 0
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Survivability",
          Src1VarTable = "InstanceVars",
          Src2Var = "OwnerArmor",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowerArmorLess",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Survivability",
          Src1VarTable = "InstanceVars",
          Src2Var = "OwnerMR",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "LowerMRLess",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "InstancedArmor",
          Src1VarTable = "InstanceVars",
          Src2Var = "LowerArmorLess",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "InstancedArmor",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "InstancedMR",
          Src1VarTable = "InstanceVars",
          Src2Var = "LowerMRLess",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "InstancedMR",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundlepainbuff"
    }
  }
}
