NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Evelynn_Ravage.dds"
BuffName = "RavageArmor"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorStealAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellStealAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ArmorStealAmount",
      Src2VarTable = "InstanceVars",
      Src1Value = -2,
      Src2Value = 0,
      DestVar = "ArmorStealAmount",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "SpellStealAmount",
      Src2VarTable = "InstanceVars",
      Src1Value = -2,
      Src2Value = 0,
      DestVar = "SpellStealAmount",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorStealAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "SpellStealAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
