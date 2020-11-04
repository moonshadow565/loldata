UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Health",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Health",
      Src1Value = 0,
      Src2Value = 0.15,
      DestVar = "HealthIncAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ViktorHexCore",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusForItem",
      ValueVarTable = "CharVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted2",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ViktorAugmentE",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
