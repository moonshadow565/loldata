BuffTextureName = "3001_Abyssal_Scepter.dds"
BuffName = "Abyssal Scepter"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicResistanceMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "MagicResistanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
