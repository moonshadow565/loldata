BuffTextureName = "BlindMonk_Hardiness.dds"
BuffName = "WayOfAgilityDodge"
AutoBuffActivateEffect = "WayofAgility02.troy"
AutoAuraBuffName = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 0.04,
      DestVar = "DodgeChanceMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatDodgeMod,
      TargetVar = "Owner",
      DeltaVar = "DodgeChanceMod",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Level",
      Src1Value = 0,
      Src2Value = 0.01,
      DestVar = "LevelSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LevelSpeedMod",
      Src1Value = 0,
      Src2Value = 0.02,
      DestVar = "MoveSpeedMod",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      Delta = 0
    }
  }
}
