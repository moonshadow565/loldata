ChannelDuration = 1.2
BuffName = "Heartseeker"
ChannelingStartBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      DestVarTable = "InstanceVars",
      SrcVar = "CastPosition"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {
      TargetVar = "Owner",
      LocationVar = "CastPosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastTimeExecuted",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "CastPosition",
      EndPosVar = "CastPosition",
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.31,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CastPosition",
          SrcVar = "CastPosition",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "CastPosition",
          EndPosVar = "CastPosition",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "CastPosition",
      EndPosVar = "CastPosition",
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false
    }
  }
}
