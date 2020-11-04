Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
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
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "maxHealth",
      OwnerVar = "Target",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Factor",
      SrcValueByLevel = {
        0.02083,
        0.02083,
        0.02083
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Factor",
      Src2Var = "maxHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Heal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "Heal",
          HealerVar = "Owner"
        }
      }
    }
  }
}
