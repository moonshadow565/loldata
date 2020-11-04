DoesntTriggerSpellCasts = true
BuffTextureName = "Annie_GuardianIncinerate.dds"
BuffName = "Infernal Guardian"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Viktor_ChaosStorm_green.troy",
      EffectNameForOtherTeam = "Viktor_ChaosStorm_red.troy",
      Flags = 0,
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "c",
      EffectID2VarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWTeamOverrideVar = "OwnerTeam",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SoundClear",
      DestVarTable = "InstanceVars",
      SrcValue = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "CenterPos"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "CenterPos",
      Range = 25000,
      Flags = "AffectEnemies AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
      IteratorVar = "Unit",
      BuffNameFilter = "ViktorChaosStormGuide",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "ViktorChaosStormGuide"
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "ViktorChaosStormGuide",
              ResetDuration = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Unit",
              SrcValue = false,
              Status = SetInvulnerable
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Unit",
              SrcValue = true,
              Status = SetTargetable
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "ViktorChaosStormGuide"
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "ViktorChaosStormGuide",
              ResetDuration = 0
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Unit",
              CallForHelpAttackerVar = "Unit",
              TargetVar = "Unit",
              Damage = 25000,
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 10000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "ViktorChaosStormTimer",
      ResetDuration = 0
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "ViktorChaosStorm",
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Attacker",
      DestVar = "CDMOD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CDMOD",
      Src1Value = 120,
      Src2Value = 0,
      DestVar = "NEWCD",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "NEWCD",
      Src1Value = 120,
      Src2Value = 0,
      DestVar = "NEWCD",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NEWCD",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Attacker",
      BroadcastEvent = false
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SoundClear",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "PartThing",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "GrandDistance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Caster"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MinDistanceCheck",
      SrcValue = 350
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxDistanceCheck",
      SrcValue = 950
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxDistanceCheck",
      Src2Var = "MinDistanceCheck",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DistanceVariation",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "MaxSpeed", SrcValue = 450}
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "MinSpeed", SrcValue = 175}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxSpeed",
      Src2Var = "MinSpeed",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpeedVariation",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "GrandDistance",
      Src2Var = "MinDistanceCheck",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncMoveSpeedFloorMod,
          TargetVar = "Owner",
          DeltaVar = "MaxSpeed",
          Delta = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrSpeed",
          DestVarTable = "CharVars",
          SrcVar = "MaxSpeed"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "GrandDistance",
      Src2Var = "MaxDistanceCheck",
      Value2 = 1500,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncMoveSpeedFloorMod,
          TargetVar = "Owner",
          DeltaVar = "MinSpeed",
          Delta = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrSpeed",
          DestVarTable = "CharVars",
          SrcVar = "MinSpeed"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "GrandDistance",
          Src2Var = "MinDistanceCheck",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "OffsetValue",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "OffsetValue",
          Src2Var = "DistanceVariation",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercOverMinDist",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercOverMinDist",
          Src2Var = "SpeedVariation",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "SpeedToReduce",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxSpeed",
          Src2Var = "SpeedToReduce",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "AdjustedSpeed",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncMoveSpeedFloorMod,
          TargetVar = "Owner",
          DeltaVar = "AdjustedSpeed",
          Delta = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrSpeed",
          DestVarTable = "CharVars",
          SrcVar = "AdjustedSpeed"
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      SrcValueByLevel = {
        10,
        15,
        20
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Caster",
      DestVar = "OwnerTeamID"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Caster",
      DestVar = "APPreMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "APPreMod",
      Src1Value = 0.06,
      Src2Value = 0,
      DestVar = "APPostMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "APPostMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
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
          Range = 350,
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
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "FinalDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "Viktor_ChaosStorm_beam.troy",
              Flags = 0,
              EffectIDVar = "ParticleID",
              EffectIDVarTable = "InstanceVars",
              BoneName = "head",
              TargetObjectVar = "Unit",
              TargetBoneName = "spine",
              SpecificUnitOnlyVar = "Unit",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_NEUTRAL,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "Viktor_ChaosStorm_hit.troy",
              Flags = 0,
              EffectIDVar = "hi",
              BoneName = "root",
              TargetObjectVar = "Unit",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_NEUTRAL,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "SoundClear",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "viktor_chaosstorm_damage_sound.troy",
                  Flags = 0,
                  EffectIDVar = "PartThing",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_NEUTRAL,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  PersistsThroughReconnect = false,
                  BindFlexToOwnerPAR = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SoundClear",
                  DestVarTable = "InstanceVars",
                  SrcValue = false
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Caster", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 2500,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Unit"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SoundClear",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Distance",
              Value2 = 350,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SoundClear",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectRemove,
                Params = {
                  EffectIDVar = "PartThing",
                  EffectIDVarTable = "InstanceVars"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {}
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorchaosstorm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_chaosstorm_damage_sound.troy"
    }
  }
}
