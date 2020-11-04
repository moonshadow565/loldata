BuffTextureName = "Blitzcrank_RocketGrab.dds"
BuffName = "RocketGrab"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Attacker", PositionVar = "LandPos"}
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "LandPos",
      Speed = 1350,
      Gravity = 5,
      MoveBackBy = 0
    }
  }
}
