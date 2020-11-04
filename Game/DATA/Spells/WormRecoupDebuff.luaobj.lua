BuffTextureName = "1031_Chain_Vest.dds"
BuffName = "WormRecoupDebuff"
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WormRecouperate1"
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WormRecoupDebuff",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wormrecouperate1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wormrecoupdebuff"
    }
  }
}
