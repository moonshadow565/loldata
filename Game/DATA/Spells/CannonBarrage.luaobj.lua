NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CastPosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 12,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      SrcVar = "CastPosition",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = 0.15, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 300,
              OffsetAngle = 45,
              PositionVar = "CastPosition"
            }
          },
          {
            Function = BBGetRandomPointInAreaPosition,
            Params = {
              PosVar = "CastPosition",
              Radius = 300,
              InnerRadius = 0,
              ResultVar = "CannonPosition"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Value1 = 0.15, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 300,
              OffsetAngle = 135,
              PositionVar = "CastPosition"
            }
          },
          {
            Function = BBGetRandomPointInAreaPosition,
            Params = {
              PosVar = "CastPosition",
              Radius = 300,
              InnerRadius = 0,
              ResultVar = "CannonPosition"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Value1 = 0.15, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 300,
              OffsetAngle = 225,
              PositionVar = "CastPosition"
            }
          },
          {
            Function = BBGetRandomPointInAreaPosition,
            Params = {
              PosVar = "CastPosition",
              Radius = 300,
              InnerRadius = 0,
              ResultVar = "CannonPosition"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Value1 = 0.15, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 300,
              OffsetAngle = 315,
              PositionVar = "CastPosition"
            }
          },
          {
            Function = BBGetRandomPointInAreaPosition,
            Params = {
              PosVar = "CastPosition",
              Radius = 300,
              InnerRadius = 0,
              ResultVar = "CannonPosition"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetRandomPointInAreaPosition,
            Params = {
              PosVar = "CastPosition",
              Radius = 600,
              InnerRadius = 100,
              ResultVar = "CannonPosition"
            }
          }
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Nothing",
          PosVar = "CannonPosition",
          EndPosVar = "CannonPosition",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {
      DestVar = "CastPosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      DestVarTable = "NextBuffVars",
      SrcVar = "CastPosition"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_green.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
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
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_green.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamOfOwner",
      Radius = 650,
      PosVar = "CastPosition",
      Duration = 8,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "HiddenMinion",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "CastPosition",
      Team = TEAM_CASTER,
      TeamVar = "TeamOfOwner",
      Stunned = false,
      Rooted = true,
      Silenced = true,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Owner",
      BuffName = "CannonBarrage",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pirate_cannonbarrage_aoe_indicator_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pirate_cannonbarrage_aoe_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cannonbarrage"
    }
  }
}
