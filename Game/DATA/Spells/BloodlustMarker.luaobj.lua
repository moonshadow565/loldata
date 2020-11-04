BuffTextureName = "DarkChampion_Bloodlust.dds"
BuffName = "Blood Lust"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
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
      DestVar = "baseDmg",
      SrcValueByLevel = {
        5,
        10,
        15,
        20,
        25
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "healthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "healthPercent",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "missingPercent",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "dmgPerMissingHealth",
      SrcValueByLevel = {
        15,
        20,
        25,
        30,
        35
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "dmgPerMissingHealth",
      Src2Var = "missingPercent",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "variableDmg",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "variableDmg",
      Src2Var = "baseDmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "totalBonusDmg",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "totalBonusDmg",
      Delta = 0
    }
  }
}
