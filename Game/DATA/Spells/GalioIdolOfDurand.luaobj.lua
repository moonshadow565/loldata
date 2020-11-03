NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
ChannelDuration = 2
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
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          SendIfOnScreenOrDiscard = false,
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
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
      Src2Value = 0.05,
      DestVar = "BonusDmgPercent",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDmgPercent",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "totalDmgPercent",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 575,
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
          DamageVar = "BaseDamage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 0,
          PercentOfAttackVar = "totalDmgPercent",
          SpellDamageRatio = 0.6,
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
          BuffName = "Taunt",
          ResetDuration = 0
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "GalioIdolOfDurandTaunt",
          ResetDuration = 0
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
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
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
          Range = 550,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "GalioIdolOfDurandMarker",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Unit",
              SourceVar = "Owner"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "GalioIdolOfDurandMarker",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Unit",
              Duration = 1.5
            }
          }
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
  },
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Target",
      SourceVar = "Owner"
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
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Duration = 2
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
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurand",
      ResetDuration = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 575,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 1,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GalioIdolOfDurand",
      ResetDuration = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 575,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 1,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
