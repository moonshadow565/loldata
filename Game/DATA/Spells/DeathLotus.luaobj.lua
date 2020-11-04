NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 2.65
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
TriggersSpellCasts = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 550,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 3,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Unit",
          PosVar = "Owner",
          EndPosVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 550,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathLotusSound",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      DestVarTable = "NextBuffVars",
      SrcVar = "Level"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathLotusSound"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathLotus"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathLotusSound"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathLotus"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathlotussound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "deathlotus"}
  }
}
