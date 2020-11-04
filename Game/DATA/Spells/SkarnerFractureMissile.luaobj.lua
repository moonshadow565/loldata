NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "SkarnerFracture.dds"
BuffName = "SkarnerFracture"
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Caster", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Skarner_Fracture_Tar.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Caster",
      Src2Var = "Attacker",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "Count",
          TargetVar = "Attacker",
          CasterVar = "Attacker",
          BuffName = "SkarnerFracture"
        }
      },
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "Duration",
          TargetVar = "Owner",
          BuffName = "SkarnerFractureMissile"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "SkarnerFractureMissile"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealingAmount",
          SrcValueByLevel = {
            30,
            45,
            60,
            75,
            90
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Attacker",
          DestVar = "APStat"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APStat",
          Src1Value = 0,
          Src2Value = 0.3,
          DestVar = "BonusHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealingAmount",
          Src2Var = "BonusHeal",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealingAmount",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Level", SrcVar = "Count"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Level",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealingMod",
          SrcValueByLevel = {
            1,
            0.5,
            0.25,
            0.125,
            0.0625,
            0.0625,
            0.0625,
            0.0625,
            0.0625,
            0.0625
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealingAmount",
          Src2Var = "HealingMod",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealingAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "Skarner_Fracture_Tar_Consume.troy",
          Flags = 0,
          EffectIDVar = "MotaExplosion",
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
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Attacker",
          Delta = 0,
          DeltaVar = "HealingAmount",
          HealerVar = "Attacker"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "galio_bulwark_heal.troy",
          Flags = 0,
          EffectIDVar = "HealVFX",
          TargetObjectVar = "Attacker",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "SkarnerFracture",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 8,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "Duration",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        120,
        160,
        200,
        240
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.7,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "Count",
          TargetVar = "Attacker",
          CasterVar = "Attacker",
          BuffName = "SkarnerFracture"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealingAmount",
          SrcValueByLevel = {
            30,
            45,
            60,
            75,
            90
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Attacker",
          DestVar = "APStat"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APStat",
          Src1Value = 0,
          Src2Value = 0.3,
          DestVar = "BonusHeal",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealingAmount",
          Src2Var = "BonusHeal",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealingAmount",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Level", SrcVar = "Count"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Level",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Level",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealingMod",
          SrcValueByLevel = {
            1,
            0.5,
            0.25,
            0.125,
            0.0625,
            0.0625,
            0.0625,
            0.0625,
            0.0625,
            0.0625
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealingAmount",
          Src2Var = "HealingMod",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "HealingAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "Skarner_Fracture_Tar_Consume.troy",
          Flags = 0,
          EffectIDVar = "MotaExplosion",
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
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Attacker",
          Delta = 0,
          DeltaVar = "HealingAmount",
          HealerVar = "Attacker"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Attacker",
          EffectName = "galio_bulwark_heal.troy",
          Flags = 0,
          EffectIDVar = "HealVFX",
          TargetObjectVar = "Attacker",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "SkarnerFracture",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 8,
          NumberOfStacks = 1,
          Duration = 6,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "SkarnerFractureMissile",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 6,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_fracture_tar_consume.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bulwark_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerfracture"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerfracturemissile"
    }
  }
}
