NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Fiddlesticks_DarkWind.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "Global_Silence.troy"
ChainMissileParameters = {
  MaximumHits = {
    3,
    5,
    7,
    9,
    11
  },
  CanHitCaster = 0,
  CanHitSameTarget = 1,
  CanHitSameTargetConsecutively = 0
}
PopupMessage1 = "game_floatingtext_Silenced"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSilenced
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetSilenced
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSilenced
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "DarkWindStacks",
          TargetVar = "Target",
          BuffName = "DarkWind"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DarkWindStacks",
          Src1Value = 0,
          Src2Value = 0.75,
          DestVar = "DurationByStack",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DurationByStack",
          Src1Value = 0,
          Src2Value = 1.5,
          DestVar = "DarkWindDuration",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Silence,
          MaxStack = 6,
          NumberStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "DarkWindDuration",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "TargetNum", Info = GetCastSpellTargetsHitPlusOne}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetNum",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 100,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.35,
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
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 100,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.35,
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
    Params = {Name = "darkwind"}
  }
}
