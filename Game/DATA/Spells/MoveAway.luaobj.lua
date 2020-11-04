NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "MoveAway"
Nondispellable = true
PopupMessage1 = "game_floatingtext_Knockup"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Distance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Gravity",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Speed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Center",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Center",
      SrcVar = "Center",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMoveAway,
    Params = {
      UnitVar = "Owner",
      AwayFromVar = "Center",
      Speed = 0,
      Gravity = 0,
      Distance = 0,
      DistanceVar = "Distance",
      DistanceVarTable = "InstanceVars",
      SpeedVar = "Speed",
      SpeedVarTable = "InstanceVars",
      GravityVar = "Gravity",
      GravityVarTable = "InstanceVars",
      DistanceInner = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      IdealDistance = 0
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
