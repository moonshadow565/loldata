NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
SpellDamageRatio = 1
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "BloodkingVladimir"
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "numTideStacks",
      Src1VarTable = "CharVars",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "Multiplier",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        60,
        90,
        120,
        150,
        180
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src2Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalDamage",
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
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "FinalDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.45,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "VladimirSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "VladimirSkinID",
      Value2 = 5,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "VladTidesofBlood_BloodKing_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          EffectName = "VladTidesofBlood_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
BuffOnHealBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Health",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Owner",
          BuffName = "VladimirTidesofBloodCost"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 0.08,
          DestVar = "bonusHealPercent",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "bonusHealPercent",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "healRatio",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "healRatio",
          Src2Var = "Health",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "EffectiveHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {
          SrcVar = "EffectiveHeal"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladtidesofblood_bloodking_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladtidesofblood_tar.troy"
    }
  }
}
