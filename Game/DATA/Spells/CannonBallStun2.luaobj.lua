OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "CannonBallStun"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "CannonBallStun"
        }
      }
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Duration = 0.75
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cannonballstun"
    }
  }
}
