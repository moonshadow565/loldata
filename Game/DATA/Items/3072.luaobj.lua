AutoBuffActivateEffect = "EternalThirst_buf.troy"
UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "PhysicalDamageBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "PercentLifeSteal",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "PhysicalDamageBonus",
      ValueVarTable = "InstanceVars",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentLifeSteal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "PercentLifeStealTT",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "PercentLifeStealTT",
      Index = 2,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetVar = "Attacker"
    }
  }
}
ItemOnKillBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "PhysicalDamageBonus",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentLifeSteal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.0025,
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PhysicalDamageBonus",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 40,
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentLifeSteal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  }
}
ItemOnDeathBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PhysicalDamageBonus",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentLifeSteal",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
