OnBuffActivateBuildingBlocks = {
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "Swain_noBird",
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBPopCharacterData,
    Params = {
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "swain_nobird"
    }
  }
}
