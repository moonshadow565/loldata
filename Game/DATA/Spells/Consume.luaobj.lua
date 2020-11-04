NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Yeti_Consume.dds"
BuffName = ""
AutoBuffActivateEffect = "Consume_buf.troy"
AutoCooldownByLevel = {
  35,
  30,
  25,
  20,
  15
}
UpdateBuffsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Meditate_eff.troy",
      Flags = 0,
      EffectIDVar = "ar",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthToInc",
      SrcValueByLevel = {
        125,
        180,
        235,
        290,
        345
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthToInc",
      Src2Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToInc",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthToInc",
      HealerVar = "Owner"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Target",
      BuffName = "ResistantSkin"
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            250,
            300,
            350,
            400,
            450
          },
          Damage = 0,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
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
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            500,
            600,
            700,
            800,
            900
          },
          Damage = 0,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
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
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "resistantskin"
    }
  }
}
