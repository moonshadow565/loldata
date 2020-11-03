NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ShyvanaScorchedEarth.dds"
BuffName = "ShyvanaScorchedEarth"
AutoBuffActivateEffect = "shyvana_scorchedEarth_01.troy"
AutoBuffActivateEffect2 = "shyvana_scorchedEarth_speed.troy"
AutoBuffActivateAttachBoneName2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "BonusAD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "BonusAD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamagePerTick",
      Src1VarTable = "InstanceVars",
      Src2Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamagePerTick",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 325,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "DamagePerTick",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "shyvana_scorchedEarth_unit_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Unit",
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HitCount",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
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
          Range = 325,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamagePerTick",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "shyvana_scorchedEarth_unit_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Unit",
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
        Function = BBMath,
        Params = {
          Src1Var = "MovementSpeed",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.85,
          DestVar = "MovementSpeed",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitCount",
      Src1VarTable = "CharVars",
      Value2 = 5,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBGetBuffRemainingDuration,
        Params = {
          DestVar = "RemainingDuration",
          TargetVar = "Owner",
          BuffName = "ShyvanaImmolationAura"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RemainingDuration",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "NewDuration",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MovementSpeed",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.3,
            0.35,
            0.4,
            0.45,
            0.5
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamagePerTick",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            25,
            40,
            55,
            70,
            85
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "ShyvanaImmolationAura",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "NewDuration",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "HitCount",
          Src1VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HitCount",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MovementSpeed",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.3,
        0.35,
        0.4,
        0.45,
        0.5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamagePerTick",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        25,
        40,
        55,
        70,
        85
      }
    }
  },
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
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_scorchedearth_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaimmolationaura"
    }
  }
}
