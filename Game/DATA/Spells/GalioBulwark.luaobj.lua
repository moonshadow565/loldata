NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Galio_Bulwark.dds"
BuffName = "GalioBulwark"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDefense",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "HealAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Owner",
          SourceVar = "Attacker"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "galio_bullwark_target_shield_01.troy",
          Flags = 0,
          EffectIDVar = "TargetVFX",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false
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
          BindObjectVar = "Owner",
          EffectName = "galio_bullwark_target_shield_01_self.troy",
          Flags = 0,
          EffectIDVar = "SelfTargetVFX",
          EffectIDVarTable = "InstanceVars",
          BoneName = "chest",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "TargetVFX",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "SelfTargetVFX",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "BonusDefense",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "BonusDefense",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = DAMAGESOURCE_PERIODIC, CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT},
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Caster"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealAmount",
          DestVarTable = "NextBuffVars",
          SrcVar = "HealAmount",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Caster",
          AttackerVar = "Caster",
          BuffName = "GalioBulwarkHeal",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealAmount",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.8,
          DestVar = "HealAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HealAmount",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HealAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Caster",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "galio_bullwark_shield_activate_self.troy",
              Flags = 0,
              EffectIDVar = "GalioHitVFX",
              BoneName = "C_BUFFBONE_GLB_CHEST_LOC",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
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
              BindObjectVar = "Owner",
              EffectName = "galio_bullwark_shield_activate.troy",
              Flags = 0,
              EffectIDVar = "AllyHitVFX",
              TargetObjectVar = "Owner",
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
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDefense",
      DestVarTable = "NextBuffVars",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseHeal",
      SrcValueByLevel = {
        20,
        32,
        44,
        56,
        68
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
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
      Src1Var = "BaseHeal",
      Src2Var = "BonusHeal",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealAmount",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "HealAmount"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_target_shield_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_target_shield_01_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiobulwarkheal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_shield_activate_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_shield_activate.troy"
    }
  }
}
