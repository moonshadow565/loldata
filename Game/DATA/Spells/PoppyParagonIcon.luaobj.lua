BuffTextureName = "PoppyDefenseOfDemacia.dds"
BuffName = "PoppyParagonManager"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "PoppyParagonStats"
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Count",
      Index = 1
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmDmgValue",
      SrcValueByLevel = {
        1.5,
        2,
        2.5,
        3,
        3.5
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "ArmDmgValue",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ArmDmgValue",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ArmDmgValue",
      Index = 2
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyparagonstats"
    }
  }
}
