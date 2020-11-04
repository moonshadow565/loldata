OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "ResistantSkin"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "ResistantSkinDragon"
        },
        SubBlocks = {
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
              MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
              IdealDistance = 100
            }
          },
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
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "ResistantSkin"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "ResistantSkinDragon"
        },
        SubBlocks = {
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
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "ResistantSkin"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "ResistantSkinDragon"
        },
        SubBlocks = {
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
      }
    }
  }
}
