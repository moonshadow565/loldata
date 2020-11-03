BuffTextureName = "Nasus_SpiritFire.dds"
BuffName = "SpiritFire"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorReduction",
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
      DeltaVar = "ArmorReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
