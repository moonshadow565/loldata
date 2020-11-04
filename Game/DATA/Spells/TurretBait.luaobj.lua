BuffTextureName = "Judicator_EyeforanEye.dds"
BuffName = "Reinforce"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusArmor",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "BonusArmor",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
    SubBlocks = {
      {
        Function = BBApplyTaunt,
        Params = {
          AttackerVar = "Owner",
          TargetVar = "Target",
          Duration = 5
        }
      }
    }
  }
}
