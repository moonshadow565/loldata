BuffTextureName = "Trundle_Pillar.dds"
BuffName = "TrundleWallPush"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TrueMove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMoveAway,
    Params = {
      UnitVar = "Owner",
      AwayFromVar = "Attacker",
      Speed = 750,
      Gravity = 0,
      Distance = 0,
      DistanceVar = "TrueMove",
      DistanceVarTable = "InstanceVars",
      DistanceInner = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0,
      IdealDistanceVar = "TrueMove",
      IdealDistanceVarTable = "InstanceVars"
    }
  }
}
