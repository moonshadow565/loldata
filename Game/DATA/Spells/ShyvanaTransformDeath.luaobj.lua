PersistsThroughDeath = true
NonDispellable = true
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
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CasterID",
      RequiredVarTable = "InstanceVars"
    }
  }
}
