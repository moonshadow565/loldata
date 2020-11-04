NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Cassiopeia_DeadlyCadence.dds"
BuffName = "CassiopeiaDeadlyCadence"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentMod",
      DestVarTable = "InstanceVars",
      SrcValue = -0.1
    }
  },
  {
    Function = BBGetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      IncCostVar = "CurCost",
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurCost",
      Src2Var = "PercentMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Cost",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Cost",
      Src1Value = 0,
      Src2Value = -100,
      DestVar = "Tooltip",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Tooltip",
      Index = 1
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "Cost",
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "Cost",
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "Cost",
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      CostVar = "Cost",
      PARType = PAR_MANA
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARMultiplicativeCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  }
}
