NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Attacker",
      DestVar = "AttackDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "AttackDamage",
      Src1Value = 0.75,
      Src2Value = 0,
      DestVar = "AttackBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AbilityDamage",
      SrcValueByLevel = {
        35,
        70,
        105,
        140,
        175
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackBonus",
      Src2Var = "AbilityDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "missFortune_richochet_tar_first.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "LocationFinder",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "Target",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = true,
      Invulnerable = true,
      MagicImmune = true,
      IgnoreCollision = true,
      Placemarker = true,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Nothing"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Attacker",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other1", LocationVar = "Attacker"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Other1", PositionVar = "TargetPos"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Other1",
      Range = 575,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Other1",
          Src2Var = "Unit",
          CompareOp = CO_IS_TARGET_BEHIND_ME
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "MissFortuneRShotHolder",
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
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Other1",
      Range = 575,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "MissFortuneRShotHolder",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Unit",
          PosVar = "Unit",
          EndPosVar = "Unit",
          OverrideCastPosition = true,
          OverrideCastPosVar = "TargetPos",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = false,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_richochet_tar_first.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
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
      Name = "missfortunershotholder"
    }
  }
}
