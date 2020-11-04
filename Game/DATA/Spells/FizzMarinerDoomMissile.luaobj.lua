NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MissilePosition",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "willStick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetGroundHeight,
    Params = {
      QueryPosVar = "MissilePosition",
      QueryPosVarTable = "InstanceVars",
      GroundPosVar = "GroundPos"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "GroundPos",
      EffectName = "Fizz_Ring_Green.troy",
      EffectNameForOtherTeam = "Fizz_Ring_Red.troy",
      Flags = 0,
      EffectIDVar = "Temp4",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Temp3",
      EffectID2VarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Nothing",
      TargetPosVar = "MissilePosition",
      TargetPosVarTable = "InstanceVars",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "GroundPos",
      EffectName = "Fizz_UltimateMissile_Orbit.troy",
      EffectNameForOtherTeam = "Fizz_UltimateMissile_Orbit.troy",
      Flags = 0,
      EffectIDVar = "Temp",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Temp2",
      EffectID2VarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Nothing",
      TargetPosVar = "MissilePosition",
      TargetPosVarTable = "InstanceVars",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 350,
      PosVar = "MissilePosition",
      PosVarTable = "InstanceVars",
      Duration = 3,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "TempVision",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Exploded",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Temp3",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Temp4",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Exploded",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissilePosition",
          CenterVarTable = "InstanceVars",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CenterPos",
              DestVarTable = "NextBuffVars",
              SrcVar = "MissilePosition",
              SrcVarTable = "InstanceVars"
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
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "OMNOMNOMNOMONOM",
          Skin = "FizzShark",
          AiScript = "idle.lua",
          PosVar = "MissilePosition",
          PosVarTable = "InstanceVars",
          Team = TEAM_CASTER,
          TeamVar = "TeamID",
          Stunned = true,
          Rooted = true,
          Silenced = true,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          IsWard = true,
          Placemarker = false,
          VisibilitySize = 100,
          DestVar = "Other1",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBGetGroundHeight,
        Params = {
          QueryPosVar = "MissilePosition",
          QueryPosVarTable = "InstanceVars",
          GroundPosVar = "GroundPos"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "GroundPos",
          EffectName = "Fizz_SharkSplash.troy",
          EffectNameForOtherTeam = "Fizz_SharkSplash.troy",
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
          TargetVar = "Other1",
          AttackerVar = "Other1",
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
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Exploded",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "willStick",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissilePosition",
          CenterVarTable = "InstanceVars",
          Range = 150,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "Duration",
              TargetVar = "Owner",
              BuffName = "FizzMarinerDoomMissile"
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
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Temp3",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Temp4",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "FizzMarinerDoomBomb",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Damage,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "Duration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Exploded",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "UltFired",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissilePosition",
          DestVarTable = "NextBuffVars",
          SrcVar = "MissileEndPosition"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "willStick",
          DestVarTable = "NextBuffVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FizzMarinerDoomMissile",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "UltFired",
          DestVarTable = "CharVars",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "UltFired",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBDestroyMissile,
    Params = {
      MissileIDVar = "MissileNetworkID"
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "FizzMarinerDoomBomb",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Damage,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "UltFired",
      DestVarTable = "CharVars",
      SrcValue = false
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Nothing",
      BuffName = "FizzMarinerDoomBomb"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {
          UnitVar = "Target",
          PositionVar = "MissileEndPosition"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissilePosition",
          DestVarTable = "NextBuffVars",
          SrcVar = "MissileEndPosition"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "willStick",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FizzMarinerDoomMissile",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
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
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_ultimatemissile_orbit.troy"
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
    Params = {
      Name = "fizzmarinerdoomslow"
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoombomb"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzmarinerdoommissile"
    }
  }
}
