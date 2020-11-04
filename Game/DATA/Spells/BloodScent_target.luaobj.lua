BuffTextureName = "Wolfman_Bloodscent.dds"
BuffName = "Blood Scent"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "CasterID",
      Radius = 1000,
      TargetVar = "Owner",
      Duration = 120,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleStuff",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleStuff",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
