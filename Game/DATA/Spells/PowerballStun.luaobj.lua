BuffTextureName = "Armordillo_Powerball.dds"
BuffName = "PowerballStun"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Dist",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Owner"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Dist",
      Src1Value = 225,
      Src2Value = 0,
      DestVar = "Dist",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMoveAway,
    Params = {
      UnitVar = "Owner",
      AwayFromVar = "Attacker",
      Speed = 200,
      Gravity = 10,
      Distance = 0,
      DistanceVar = "Dist",
      DistanceInner = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 100
    }
  },
  {
    Function = BBApplyRoot,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Duration = 0.5
    }
  }
}
