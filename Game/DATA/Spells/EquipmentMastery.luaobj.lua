BuffTextureName = "Armsmaster_MasterOfArms.dds"
BuffName = "EquipmentMastery"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "APHealthAdded",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackHealthAdded",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AttackTotal",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APTotal",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "APTotal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 2,
      DestVar = "APHealthAdded",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackTotal",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 3,
      DestVar = "AttackHealthAdded",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncMaxHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "APHealthAdded",
      DeltaVarTable = "InstanceVars",
      IncCurrentHealth = false
    }
  },
  {
    Function = BBIncMaxHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "AttackHealthAdded",
      DeltaVarTable = "InstanceVars",
      IncCurrentHealth = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APTotal",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AttackTotal",
      DestVarTable = "InstanceVars"
    }
  }
}
