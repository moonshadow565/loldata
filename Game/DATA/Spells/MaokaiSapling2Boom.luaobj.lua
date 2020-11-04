TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "buffDuration",
      SrcValueByLevel = {
        5,
        5,
        5,
        5,
        5
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "maoki_sapling_unit_tar.troy",
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
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      SrcValueByLevel = {
        40,
        75,
        110,
        145,
        180
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MineDamageAmount",
      SrcValueByLevel = {
        80,
        130,
        180,
        230,
        280
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "TargetPos",
      Range = 240,
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
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "DamageAmount",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.4,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "DoABarrelRoll",
      Skin = "Maokai_Sproutling",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamID",
      Stunned = false,
      Rooted = false,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = false,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Other1",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Other1",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MineDamageAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "MineDamageAmount"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Sprung",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "MaokaiSaplingMine",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25,
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
      Name = "maoki_sapling_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "maokai_sproutling"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaisaplingmine"
    }
  }
}
