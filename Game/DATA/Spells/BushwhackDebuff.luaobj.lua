NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "NIdalee_Bushwhack.dds"
BuffName = "Bushwhack"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Debuff",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -100,
      DestVar = "TooltipDebuff",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TooltipDebuff",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "Debuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
