NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Voidwalker_Riftwalk.dds"
BuffName = "RiftWalk"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = ""
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "CastPos"}
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
      Point2Var = "CastPos"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "CastPos"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 475,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 475,
          OffsetAngle = 0,
          PositionVar = "CastPos"
        }
      }
    }
  },
  {
    Function = BBTeleportToPosition,
    Params = {OwnerVar = "Owner", CastPositionName = "CastPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "OwnerPos",
          EffectName = "Ezreal_arcaneshift_cas.troy",
          Flags = 0,
          EffectIDVar = "p3",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 225,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "OwnerPos",
          EffectName = "Ezreal_arcaneshift_cas.troy",
          Flags = 0,
          EffectIDVar = "p3",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 225,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "CasterID"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 750,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "CasterID",
          Radius = 100,
          TargetVar = "Unit",
          Duration = 1,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "BubbleID",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Attacker", LocationVar = "Unit"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Unit",
          PosVar = "Owner",
          EndPosVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 1,
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
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "teamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Ezreal_arcaneshift_flash.troy",
          Flags = 0,
          EffectIDVar = "ar1",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 225,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Ezreal_arcaneshift_flash.troy",
          Flags = 0,
          EffectIDVar = "ar1",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 225,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_flash.troy"
    }
  }
}
