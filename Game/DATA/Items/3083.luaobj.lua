UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "ExtraHP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "ExtraRegen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ExtraHP",
      ValueVarTable = "InstanceVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ExtraRegen",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 5,
      DestVar = "ExtraRegenTT",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ExtraRegenTT",
      Index = 2,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
ItemOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 35,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 350,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
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
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 3.5,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.02,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 350,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      }
    }
  }
}
ItemOnAssistBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 35,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraHP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 350,
          DestVar = "ExtraHP",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ExtraRegen",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "ExtraRegen",
          DestVarTable = "InstanceVars",
          MathOp = MO_MIN
        }
      }
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExtraHP",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExtraRegen",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
