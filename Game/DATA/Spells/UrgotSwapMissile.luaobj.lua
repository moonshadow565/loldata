NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "SwapArrow_green.troy"
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Attacker", PositionVar = "TargetPos"}
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "enemy",
          Skin = "TestCubeRender",
          AiScript = "idle.lua",
          PosVar = "TargetPos",
          Team = TEAM_NEUTRAL,
          TeamVar = "TeamID",
          Stunned = true,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other2",
          GoldRedirectTargetVar = "Nothing"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Attacker",
          BuffName = "ExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Owner",
          BuffName = "UrgotSwapMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Other2", LocationVar = "OwnerPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Other2",
          Distance = 80,
          OffsetAngle = 90,
          PositionVar = "TargetOffsetPos"
        }
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "ownerMinion",
          Skin = "TestCubeRender",
          AiScript = "idle.lua",
          PosVar = "OwnerPos",
          Team = TEAM_NEUTRAL,
          TeamVar = "TeamID",
          Stunned = true,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Nothing"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "UrgotSwapMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Other3", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Other3",
          Distance = 80,
          OffsetAngle = 90,
          PositionVar = "OwnerOffset"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Attacker",
          BuffName = "ExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 7,
          SlotType = ExtraSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "UrgotSwapMissile",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Attacker",
          PosVar = "TargetPos",
          EndPosVar = "TargetPos",
          OverrideCastPosition = true,
          OverrideCastPosVar = "OwnerOffset",
          SlotNumber = 7,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 7,
          SlotType = ExtraSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "UrgotSwapMissile2",
          TargetVar = "Attacker"
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Owner",
          PosVar = "OwnerPos",
          EndPosVar = "OwnerPos",
          OverrideCastPosition = true,
          OverrideCastPosVar = "TargetOffsetPos",
          SlotNumber = 7,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Attacker",
          BuffName = "ExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Attacker",
          BuffName = "ExpirationTimer",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      BuffName = "UrgotSwapMarker"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile2"
    }
  }
}
