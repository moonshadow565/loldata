OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "OrderTeam", SrcValue = TEAM_ORDER}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "ChaosTeam", SrcValue = TEAM_CHAOS}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "OrderTeam",
      Radius = 400,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "OrderTeam",
      Radius = 50,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID2",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "ChaosTeam",
      Radius = 400,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID3",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "ChaosTeam",
      Radius = 50,
      TargetVar = "Owner",
      Duration = 20,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID4",
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
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID2",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID3",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID4",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
