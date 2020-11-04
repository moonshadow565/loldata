NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Move"
NonDispellable = true
PopupMessage1 = "game_floatingtext_Knockup"
OnBuffActivateBuildingBlocks = {
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
      RequiredVar = "Position",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      SrcVar = "Position",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "Position",
      Speed = 0,
      SpeedVar = "Speed",
      SpeedVarTable = "InstanceVars",
      Gravity = 0,
      GravityVar = "Gravity",
      GravityVarTable = "InstanceVars",
      MoveBackBy = 0,
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
