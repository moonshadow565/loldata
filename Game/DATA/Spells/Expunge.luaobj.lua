NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ExplosionDamage",
      SrcValueByLevel = {
        20,
        30,
        40,
        50,
        60
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "DeadlyVenom"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Unit",
              BuffName = "DeadlyVenom"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseDamage",
              SrcValueByLevel = {
                30,
                60,
                90,
                120,
                150
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Count",
              Src2Var = "ExplosionDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BonusDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseDamage",
              Src2Var = "BonusDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "TotalDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "Expunge_tar_02.troy",
              Flags = 0,
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "DeadlyVenom",
              NumStacks = 0
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deadlyvenom"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "expunge_tar_02.troy"
    }
  }
}
