NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FacingPos",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnMissileEndBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "HiddenMinion",
      Skin = "OlafAxe",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_ORDER,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FacingPos",
      SrcVar = "FacingPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other3", LocationVar = "FacingPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownPerc"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownPerc",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "CooldownMult",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownMult",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "DurationVar",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DurationVar",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "DurationVar",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "OlafAxeExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "DurationVar",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.2,
        -0.25,
        -0.3,
        -0.35,
        -0.4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        0,
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Other3",
      Range = 100,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "olafSlow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 100,
          NumberOfStacks = 1,
          Duration = 2.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "OlafAxeThrowDamage",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.16,
        -0.22,
        -0.28,
        -0.34,
        -0.4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        0,
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "olafSlow",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 100,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "OlafAxeThrowDamage",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "olafaxe"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxeexpirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "olafslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxethrowdamage"
    }
  }
}
