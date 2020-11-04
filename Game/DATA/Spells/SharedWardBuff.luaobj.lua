OnBuffActivateBuildingBlocks = {
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 300,
      Flags = "AffectEnemies AffectNeutral AffectMinions ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "ResistantSkin",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMoveAway,
        Params = {
          UnitVar = "Owner",
          AwayFromVar = "Unit",
          Speed = 1000,
          Gravity = 50,
          Distance = 300,
          DistanceInner = 300,
          MovementType = FURTHEST_WITHIN_RANGE,
          MovementOrdersType = CANCEL_ORDER,
          MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
          IdealDistance = 300
        }
      }
    }
  }
}
