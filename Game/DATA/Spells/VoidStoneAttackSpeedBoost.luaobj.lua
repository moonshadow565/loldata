BuffTextureName = "Voidwalker_Netherburn.dds"
BuffName = "VoidStoneEmpowered"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedBoost",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
