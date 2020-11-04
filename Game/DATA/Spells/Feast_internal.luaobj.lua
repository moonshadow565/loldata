OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CurSkinScale",
      DestVarTable = "InstanceVars",
      SrcValue = 1.03
    }
  },
  {
    Function = BBSetScaleSkinCoef,
    Params = {
      Scale = 0,
      ScaleVar = "CurSkinScale",
      ScaleVarTable = "InstanceVars",
      OwnerVar = "Owner"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Feast"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
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
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 8,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetGhosted
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SizeByLevel",
          SrcValueByLevel = {
            0.07,
            0.11,
            0.15
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src2Var = "SizeByLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Bonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Bonus",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "MaxSkinScale",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurSkinScale",
          Src1VarTable = "InstanceVars",
          Src2Var = "MaxSkinScale",
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurSkinScale",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.03,
              DestVar = "CurSkinScale",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBSetScaleSkinCoef,
        Params = {
          Scale = 0,
          ScaleVar = "CurSkinScale",
          ScaleVarTable = "InstanceVars",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthPerStack",
          SrcValueByLevel = {
            90,
            120,
            150
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealthPerStack",
          Src2Var = "Count",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BonusHealth",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatHPPoolMod,
          TargetVar = "Owner",
          DeltaVar = "BonusHealth",
          Delta = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "feast"}
  }
}
