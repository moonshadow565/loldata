NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "XenZhao_BattleCry.dds"
BuffName = "Wuju Style"
AutoBuffActivateEffect = "WujustyleSC_buf.troy"
AutoBuffActivateAttachBoneName = "weapon"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "BaseDamage", SrcValue = 20}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Level",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "LevelDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "LevelDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "TotalDamage",
      Delta = 0
    }
  }
}
