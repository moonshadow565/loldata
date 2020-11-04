PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
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
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.5, OwnerVar = "Owner"}
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
        Function = BBIncScaleSkinCoef,
        Params = {
          Scale = 0,
          ScaleVar = "Bonus",
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
