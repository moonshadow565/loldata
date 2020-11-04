NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
TriggersSpellCasts = true
CanCastBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SelfDamage",
      SrcValueByLevel = {
        40,
        64,
        88,
        112,
        136
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentHealth",
      Src2Var = "SelfDamage",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        100,
        160,
        220,
        280,
        340
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0.4,
      DestVar = "SelfDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentHealth",
      Src2Var = "SelfDamage",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurrentHealth",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "SelfDamage",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "olaf_recklessSwing_tar_02.troy",
      Flags = 0,
      EffectIDVar = "b",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "olaf_recklessStrike_axe_charge.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_WEAPON_L_2",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_WEAPON_L_4",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "olaf_recklessStrike_axe_charge.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_WEAPON_R_2",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_WEAPON_R_4",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "olaf_recklessSwing_tar_04.troy",
      Flags = 0,
      EffectIDVar = "a",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "olaf_recklessSwing_tar_05.troy",
      Flags = 0,
      EffectIDVar = "c",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "olaf_recklessSwing_tar_03.troy",
      Flags = 0,
      EffectIDVar = "c",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "SelfDamage",
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BonusDamage",
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_recklessswing_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_recklessstrike_axe_charge.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_recklessswing_tar_04.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_recklessswing_tar_05.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_recklessswing_tar_03.troy"
    }
  }
}
