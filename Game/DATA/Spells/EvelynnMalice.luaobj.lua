BuffTextureName = "Evelynn_Drink.dds"
BuffName = "MaliceAndSpiteCanCast"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MaliceLevel",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "MaliceLevel",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DrainAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Other1"}
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Other1",
      Delta = 0,
      DeltaVar = "DrainAmount",
      HealerVar = "Other1"
    }
  }
}
