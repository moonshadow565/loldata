TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "WeaponDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "WeaponDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "Damage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TakedownDamage",
              SrcVar = "TakedownDamage",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Damage",
              Src2Var = "TakedownDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Damage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBGetManaOrHealth,
            Params = {
              DestVar = "healthPercent",
              OwnerVar = "Target",
              Function = GetHealthPercent
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "healthPercent",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "bonusPercent",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "bonusPercent",
              Src1Value = 2,
              Src2Value = 0,
              DestVar = "bonusPercent",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "bonusPercent",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "bonusPercent",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Damage",
              Src2Var = "bonusPercent",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "Damage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "Damage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = true,
              IgnoreDamageCrit = true
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "nidalee_cougar_takedown_tar.troy",
              Flags = 0,
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "Damage",
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_ATTACK,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Takedown"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougar_takedown_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "takedown"}
  }
}
