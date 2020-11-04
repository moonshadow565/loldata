NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "ViktorChaosStormGuide.dds"
BuffName = "ViktorStormTimer"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APPERLEV",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "APPERLEV",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APPERLEV",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "APPERLEV",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
