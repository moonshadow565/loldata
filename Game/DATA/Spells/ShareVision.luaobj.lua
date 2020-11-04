OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "CasterTeamID"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "CasterTeamID",
      Radius = 0,
      TargetVar = "Owner",
      Duration = 20000,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
