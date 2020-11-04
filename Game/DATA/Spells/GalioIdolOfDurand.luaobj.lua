NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 2.5
BuffTextureName = "Galio_IdolOfDurand.dds"
BuffName = "GalioIdolOfDurand"
AutoBuffActivateEffect = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        220,
        330,
        440
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HitCount",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "galio_beguilingStatue_taunt_indicator_team_green.troy",
          Flags = 0,
          EffectIDVar = "AreaVFXAlly",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "galio_beguilingStatue_taunt_indicator_team_red.troy",
          Flags = 0,
          EffectIDVar = "AreaVFXEnemy",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
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
          EffectName = "galio_beguilingStatue_taunt_indicator_team_green.troy",
          Flags = 0,
          EffectIDVar = "AreaVFXAlly",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "galio_beguilingStatue_taunt_indicator_team_red.troy",
          Flags = 0,
          EffectIDVar = "AreaVFXEnemy",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "galio_talion_channel.troy",
      Flags = 0,
      EffectIDVar = "ChannelVFX",
      EffectIDVarTable = "InstanceVars",
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ChannelVFX",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "AreaVFXAlly",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "AreaVFXEnemy",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "galio_talion_breakout.troy",
      Flags = 0,
      EffectIDVar = "ExplosionVFX",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "galio_builingStatue_impact_01.troy",
      Flags = 0,
      EffectIDVar = "ExplosionVFX",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
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
      Src2Value = 0.8,
      DestVar = "APDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src1VarTable = "InstanceVars",
      Src2Var = "APDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalBaseDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HitCount",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 8,
      DestVar = "HitCount",
      DestVarTable = "InstanceVars",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HitCount",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "BonusDmgPercent",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalBaseDamage",
      Src2Var = "BonusDmgPercent",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseDamage",
      Src1VarTable = "InstanceVars",
      Src2Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 520,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "Damage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.8,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "Taunt"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "GalioIdolOfDurandTaunt"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "galio_builingStatue_unit_impact_01.troy",
          Flags = 0,
          EffectIDVar = "TargetVFX",
          TargetObjectVar = "Unit",
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
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 520,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Owner",
              BuffName = "GalioIdolOfDurandMarker"
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Owner",
                  TargetVar = "Unit",
                  Duration = 2.5
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "GalioIdolOfDurandTaunt",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Taunt,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              },
              {
                Function = BBApplyAssistMarker,
                Params = {
                  Duration = 10,
                  TargetVar = "Unit",
                  SourceVar = "Owner"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = DAMAGESOURCE_PERIODIC,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "HitCount",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HitCount",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = TRUE_DAMAGE,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.7,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Duration = 2.5
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurandTaunt",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurandMarker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurand"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurand"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_beguilingstatue_taunt_indicator_team_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_beguilingstatue_taunt_indicator_team_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_talion_channel.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_talion_breakout.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_builingstatue_impact_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurandtaunt"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_builingstatue_unit_impact_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurandmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurand"
    }
  }
}
