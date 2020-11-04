BuffName = "GravesSmokeCloud"
AutoBuffActivateEffect = "Global_Slow.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SightReduction",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlowPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatBubbleRadiusMod,
      TargetVar = "Owner",
      DeltaVar = "SightReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "SightReduction",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "SightReduction",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatBubbleRadiusMod,
      TargetVar = "Owner",
      DeltaVar = "SightReduction",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBApplyNearSight,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Duration = 0.25
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "GravesSmokeGrenadeBoomSlow"
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentMultiplicativeMovementSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "SlowPercent",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentMultiplicativeMovementSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "SlowPercent",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 800,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBAddUnitPerceptionBubble,
            Params = {
              TeamVar = "TeamID",
              Radius = 75,
              TargetVar = "Attacker",
              Duration = 1,
              SpecificUnitsClientOnlyVar = "Nothing",
              RevealSpecificUnitOnlyVar = "Nothing",
              RevealSteath = false,
              BubbleIDVar = "Pineapple"
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "buffDuration",
      SrcValueByLevel = {
        4.5,
        4.5,
        4.5,
        4.5,
        4.5
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "Graves_SmokeGrenade_Boom.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Nothing",
      TargetPosVar = "TargetPos",
      SpecificUnitOnlyVar = "Nothing",
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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AD",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "dmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "buffDuration",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "remainder",
      MathOp = MO_MODULO
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "buffDuration",
      Src2Var = "remainder",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ticks",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamage",
      Src2Var = "ticks",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TickDamage",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "HiddenMinion",
      Skin = "TestCube",
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
      Placemarker = true,
      VisibilitySize = 50,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "GravesSmokeGrenade",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        5,
        5,
        5,
        5,
        5
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "TargetPos",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = false
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
            60,
            110,
            160,
            210,
            260
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.6,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "GravesPassiveGrit",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 0,
              MaxStackVar = "PassiveMaxStacks",
              MaxStackVarTable = "CharVars",
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "PassiveDuration",
              DurationVarTable = "CharVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "graves_smokegrenade_boom.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravessmokegrenade"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravessmokegrenadeboomslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gravespassivegrit"
    }
  }
}
