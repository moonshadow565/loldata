NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "percentOfAttack",
      SrcVar = "percentOfAttack",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "totalDamage"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "totalDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusDamage",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Ezreal_TrueShot_tar.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      BoneName = "spine",
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "EzrealRisingSpellForce",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 5,
      NumberOfStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        0,
        0,
        0,
        0,
        0
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "PhysPreMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PhysPreMod",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PhysPostMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APPreMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "APPreMod",
      Src1Value = 0.9,
      Src2Value = 0,
      DestVar = "APPostMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PhysPostMod",
      Src2Var = "APPostMod",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            350,
            500,
            650
          },
          Damage = 0,
          DamageVar = "BonusDamage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 0,
          PercentOfAttackVar = "percentOfAttack",
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.92,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.3,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MAX
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
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            350,
            500,
            650
          },
          Damage = 0,
          DamageVar = "APPostMod",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 0,
          PercentOfAttackVar = "percentOfAttack",
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.92,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "percentOfAttack",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0.3,
          DestVar = "percentOfAttack",
          DestVarTable = "CharVars",
          MathOp = MO_MAX
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_trueshot_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealrisingspellforce"
    }
  }
}
