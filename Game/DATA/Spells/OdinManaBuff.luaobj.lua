BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "OdinManaBuff"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownVar",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "PercentMana",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PercentMana",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PercentMissing",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PercentMissing",
      Src1Value = 0,
      Src2Value = 2.1,
      DestVar = "PercentMissing",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPercentPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "PercentMissing",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.15
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicPenetrationMod,
      TargetVar = "Owner",
      Delta = 0.05
    }
  }
}
