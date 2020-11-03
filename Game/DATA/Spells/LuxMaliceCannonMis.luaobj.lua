NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 1650,
      OffsetAngle = 0,
      PositionVar = "DamagePoint"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBForEachUnitInTargetRectangle,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "DamagePoint",
      HalfWidth = 100,
      HalfLength = 1700,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes NotAffectSelf ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "LuxIlluminatingFraulein"
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Unit", DestVar = "TeamID"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "IlluminateDamage",
              DamageVarTable = "CharVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "LuxPassive_tar.troy",
              Flags = 0,
              EffectIDVar = "MotaExplosion",
              TargetObjectVar = "Unit",
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
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "LuxIlluminatingFraulein"
            }
          }
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "LuxMaliceCannon_tar.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          TargetObjectVar = "Unit",
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
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          DamageByLevel = {
            300,
            400,
            500
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.85,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "LuxIlluminatingFraulein",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 6,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 1650,
      OffsetAngle = 0,
      PositionVar = "DamagePoint"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxpassive_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxmalicecannon_tar.troy"
    }
  }
}
