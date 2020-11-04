NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
ChainMissileParameters = {
  MaximumHits = {
    2,
    2,
    2,
    2,
    2
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "HSCounter", Info = GetCastSpellTargetsHitPlusOne}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      SrcValueByLevel = {
        40,
        55,
        70,
        85,
        100
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "APMod",
      Src1Value = 0,
      Src2Value = 0.28,
      DestVar = "APVampBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "APVampBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamage",
      Src1Value = 0,
      Src2Value = 0.15,
      DestVar = "HealAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Malice_marker",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HSCounter",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "DamageAmount",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.28,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealAmount",
          HealerVar = "Owner"
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
          DamageVar = "DamageAmount",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.28,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealAmount",
          HealerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "malice_marker"
    }
  }
}
