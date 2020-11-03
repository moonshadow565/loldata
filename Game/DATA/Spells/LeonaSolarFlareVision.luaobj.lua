PersistsThroughDeath = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "Bubble",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Bubble",
      RequiredVarTable = "InstanceVars"
    }
  }
}
