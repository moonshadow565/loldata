OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSlotSpellIcon,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      IconIndex = 2
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "OwnerMaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerMaxHealth",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "HealthtoAdd",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.3
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "ViktorPowerTransfer",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Haste",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "HexMageCatalyst",
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "HexMageChaosCharge",
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "HexMageChaoticStorm",
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "haste"}
  }
}
