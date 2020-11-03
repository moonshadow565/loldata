NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FizzMarinerDoom.dds"
BuffName = "FizzChurnTheWatersCling"
AutoBuffActivateEffect = "Fizz_UltimateMissile_Orbit.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 300,
      TargetVar = "Owner",
      Duration = 4,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "TempID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "Fizz_Ring_Green.troy",
      EffectNameForOtherTeam = "Fizz_Ring_Red.troy",
      Flags = 0,
      EffectIDVar = "Temp2",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Temp",
      EffectID2VarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = true,
      FollowsGroundTilt = false,
      FacesTarget = false
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.5,
        -0.6,
        -0.7
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "FizzMarinerDoomSlow",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
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
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      DamageByLevel = {
        200,
        325,
        450
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "FizzKnockup",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Stun,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.75,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = true
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Temp",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Temp2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.3,
        -0.4,
        -0.5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "FizzMarinerDoomSlow",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Owner",
      Range = 350,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Owner",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              DamageByLevel = {
                200,
                325,
                450
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CenterPos",
              DestVarTable = "NextBuffVars",
              SrcVar = "OwnerPos"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "FizzMoveback",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.5,
                -0.6,
                -0.7
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "FizzMarinerDoomSlow",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "TempID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "Omnomnomnom",
      Skin = "FizzShark",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      IsWard = false,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Other1",
      PosVar = "TargetPos",
      EffectName = "Fizz_SharkSplash.troy",
      EffectNameForOtherTeam = "Fizz_SharkSplash.troy",
      Flags = 0,
      EffectIDVar = "Temp",
      EffectID2Var = "Temp",
      BoneName = "BUFFBONE_CSTM_GROUND",
      TargetObjectVar = "Other1",
      TargetPosVar = "TargetPos",
      TargetBoneName = "BUFFBONE_CSTM_GROUND",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetGroundHeight,
    Params = {QueryPosVar = "TargetPos", GroundPosVar = "GroundPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "GroundPos",
      EffectName = "Fizz_SharkSplash_Ground.troy ",
      EffectNameForOtherTeam = "Fizz_SharkSplash_Ground.troy ",
      Flags = 0,
      EffectIDVar = "Temp",
      EffectID2Var = "Temp",
      TargetObjectVar = "Nothing",
      TargetPosVar = "GroundPos",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Other3",
      BuffName = "FizzShark",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_ring_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_ring_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoomslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzknockup"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmoveback"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash_ground.troy "
    }
  }
}
