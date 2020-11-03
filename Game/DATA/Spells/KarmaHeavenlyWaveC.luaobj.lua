NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KarmaChakra"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KarmaChakra",
          NumStacks = 1
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Attacker",
      CompareOp = CO_SAME_TEAM
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Regen", SrcValue = 0.05}
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "KarmaAP"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "KarmaAP",
          Src1Value = 0,
          Src2Value = 2.0E-4,
          DestVar = "APToAdd",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APToAdd",
          Src2Var = "Regen",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Regen",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "maxHealth",
          OwnerVar = "Target",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "curHealth",
          OwnerVar = "Target",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "maxHealth",
          Src2Var = "curHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "missHealth",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Regen",
          Src2Var = "missHealth",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealthToRestore",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseHealthRestore",
          SrcValueByLevel = {
            30,
            45,
            60,
            75,
            90,
            105
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseHealthRestore",
          Src2Var = "HealthToRestore",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealthToRestore",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Target",
          Delta = 0,
          DeltaVar = "HealthToRestore",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Attacker",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "karma_heavenlyWave_self_heal.troy",
              Flags = 0,
              EffectIDVar = "br",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
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
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "karma_heavenlyWave_ally_heal.troy",
              Flags = 0,
              EffectIDVar = "ar",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "karma_heavenlyWave_unit_tar.troy",
          Flags = 0,
          EffectIDVar = "HitEffet",
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
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            70,
            110,
            150,
            190,
            230,
            270
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.6,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakra"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_self_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_ally_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_heavenlywave_unit_tar.troy"
    }
  }
}
