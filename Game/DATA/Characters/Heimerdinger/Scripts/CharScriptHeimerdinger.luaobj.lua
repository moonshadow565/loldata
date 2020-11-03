CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
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
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
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
      BuffName = "HeimerdingerTurretDetonation",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
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
      BuffName = "TechmaturgicalIcon",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time1",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time2",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time3",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time4",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time5",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Time6",
      DestVarTable = "CharVars",
      SrcValue = 25000
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level1",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level2",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level3",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level4",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level5",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level6",
      DestVarTable = "CharVars",
      SrcValue = 4
    }
  }
}
CharOnResurrectBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 1,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "HeimerdingerTurretReady",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 2,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
CharOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      OverrideCastPosition = false,
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretdetonation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "techmaturgicalicon"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretready"
    }
  }
}
