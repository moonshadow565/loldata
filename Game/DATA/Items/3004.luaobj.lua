AutoItemActivateEffect = ""
UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxMana",
      DestVarTable = "InstanceVars",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.9,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "TearOfTheGoddessTrack",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ManamuneAttackTrack",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ManamuneAttackConversion",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
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
      ValueVar = "TearBonusMana",
      ValueVarTable = "CharVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TearOfTheGoddessTrack"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TearBonusMana",
          DestVarTable = "CharVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TearBonusMana",
      ValueVarTable = "CharVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TearBonusMana",
      ValueVarTable = "CharVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "tearofthegoddesstrack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manamuneattacktrack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manamuneattackconversion"
    }
  }
}
