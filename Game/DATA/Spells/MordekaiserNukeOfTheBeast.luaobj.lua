TargetExecuteBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        20,
        40,
        60,
        80,
        100
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "AD"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AD",
      Src2Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BaseDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      DestVarTable = "NextBuffVars",
      SrcVar = "BaseDamage"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffName = "MordekaiserNukeOfTheBeastDmg",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      BuffType = BUFF_Internal,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 0.001,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisernukeofthebeastdmg"
    }
  }
}
