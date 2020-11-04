BuffTextureName = "Blitzcrank_RocketGrab.dds"
BuffName = "RocketGrab"
PopupMessage1 = "game_floatingtext_Knockup"
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
      MoveBackBy = 100
    }
  }
}
