TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "DamageAmount"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Critical,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 1.75,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "caitlyn_headshot_tar.troy",
              Flags = 0,
              EffectIDVar = "MotaExplosion",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Target",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 2.5,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "caitlyn_headshot_tar.troy",
              Flags = 0,
              EffectIDVar = "MotaExplosion",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Target",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
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
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Critical,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 1.25,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "caitlyn_headshot_tar.troy",
              Flags = 0,
              EffectIDVar = "MotaExplosion",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Target",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 1.5,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "caitlyn_headshot_tar.troy",
              Flags = 0,
              EffectIDVar = "MotaExplosion",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Target",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageAmount",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "CaitlynHeadshot"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_headshot_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynheadshot"
    }
  }
}
