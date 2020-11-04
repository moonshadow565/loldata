NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "17.dds"
BuffName = "GarenSlash"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PopupMessage1 = "game_floatingtext_Knockup"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BouncePos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IdealDistance",
      SrcValue = 70
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Speed", SrcValue = 150}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Gravity", SrcValue = 60}
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "BouncePos",
      TargetVarTable = "InstanceVars",
      Speed = 0,
      SpeedVar = "Speed",
      Gravity = 0,
      GravityVar = "Gravity",
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "IdealDistance"
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
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
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
TargetExecuteBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearqextra"
    }
  }
}
