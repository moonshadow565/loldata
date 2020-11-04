NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 3
BuffTextureName = "Lich_Untransmutable.dds"
BuffName = "Death Defied"
AutoCooldownByLevel = {
  180,
  150,
  120
}
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "TeamID",
      Radius = 1100,
      TargetVar = "Owner",
      Duration = 25,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Defile"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Defile"
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Defile"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetNoRender
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 2,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 1,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 0,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSilenceSpellSlot,
    Params = {
      SpellSlot = 3,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Silenced",
      DestVarTable = "CharVars",
      SrcValue = true
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Caster", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "LayWaste",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 60,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Caster", LocationVar = "Pos"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Caster",
          TargetVar = "Caster",
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "WallOfPain",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 60,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Caster", LocationVar = "Pos"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Caster",
          TargetVar = "Caster",
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "FallenOne",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
          DestVar = "BaseCooldown",
          SrcValueByLevel = {
            180,
            150,
            120
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownPerc"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownPerc",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownPerc",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CooldownPerc",
          Src2Var = "BaseCooldown",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "NewCooldown",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "NewCooldown",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 60,
          OffsetAngle = 0,
          PositionVar = "Pos"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Caster", LocationVar = "Pos"}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Caster",
          TargetVar = "Caster",
          SlotNumber = 2,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "Defile",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Defile"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "Particle2",
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
                  BindObjectVar = "Caster",
                  EffectName = "Defile_red_cas.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Caster",
                  EffectName = "Defile_green_cas.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = true,
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
                  BindObjectVar = "Caster",
                  EffectName = "Defile_red_cas.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Caster",
                  EffectName = "Defile_green_cas.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Nothing",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = true,
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
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "FallenOneTarget",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
ChannelingUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2.95,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBStopChanneling,
        Params = {
          CasterVar = "Owner",
          StopCondition = ChannelingStopCondition_NotCancelled,
          StopSource = ChannelingStopSource_NotCancelled
        }
      }
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit"
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
          TargetVar = "Unit",
          DamageByLevel = {
            250,
            400,
            550
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.7
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "FallenOne_nova.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          TargetObjectVar = "Target",
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
BuffOnLaunchMissileBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "defile"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "defile_red_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "defile_green_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fallenonetarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fallenone_nova.troy"
    }
  }
}
