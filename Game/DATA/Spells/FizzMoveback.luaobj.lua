BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Stun"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CenterPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBDistanceBetweenObjectAndPoint,
    Params = {
      DestVar = "Distance",
      ObjectVar = "Owner",
      PointVar = "CenterPos",
      PointVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 150,
      DestVar = "Distance",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMoveAway,
    Params = {
      UnitVar = "Owner",
      AwayFromVar = "CenterPos",
      AwayFromVarTable = "InstanceVars",
      Speed = 750,
      Gravity = 35,
      Distance = 0,
      DistanceVar = "Distance",
      DistanceInner = 0,
      MovementType = FIRST_WALL_HIT,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = KEEP_CURRENT_FACING,
      IdealDistance = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
