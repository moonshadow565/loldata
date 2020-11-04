BuffTextureName = "BlindMonk_SightUnseeing.dds"
BuffName = "SightUnseeing"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BubbleRadius",
      RequiredVarTable = "CharVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 0,
      RadiusVar = "BubbleRadius",
      RadiusVarTable = "CharVars",
      TargetVar = "Owner",
      Duration = 9999,
      SpecificUnitsClientOnlyVar = "Owner",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "ThisBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "ThisBubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
