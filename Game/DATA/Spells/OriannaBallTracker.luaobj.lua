BuffTextureName = "Blitzcrank_StaticField.dds"
BuffName = "ShadowWalk"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MyPosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BallPosition",
      DestVarTable = "CharVars",
      SrcVar = "MyPosition",
      SrcVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Attacker",
      BuffName = "OrianaGhost"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  }
}
