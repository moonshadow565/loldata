NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 1050,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 900,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false
    }
  }
}
