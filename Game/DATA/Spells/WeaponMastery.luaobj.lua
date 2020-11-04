BuffTextureName = "Armsmaster_MasterOfArms.dds"
BuffName = "WeaponMastery"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageAdded",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "WeaponDamage",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "WeaponDamage",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.131,
      DestVar = "DamageAdded",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageAdded",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "WeaponDamage",
      DestVarTable = "InstanceVars"
    }
  }
}
