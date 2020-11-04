NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "SwainRavenousFlock.dds"
BuffName = "SwainMetamorphism"
SpellToggleSlot = 4
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCost",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCostInc",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "Swain_Raven",
      TargetVar = "Owner",
      IDVar = "RavenID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "swain_metamorph.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Owner",
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
      EffectName = "swain_metamorph_02.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
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
      EffectName = "swain_demonForm_idle.troy",
      Flags = 0,
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
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
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 625,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 3,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Unit",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = false,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = false,
              UpdateAutoAttackTimer = false
            }
          }
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "swain_metamorph.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Owner",
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
    Params = {DestVar = "BuffCheck", SrcValue = 0}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainBeamSelf"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SwainBeamTransition",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 10,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BuffCheck",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "BuffCheck",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Multiplier",
      Src1Value = 15,
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
    Function = BBIf,
    Params = {
      Src1Var = "BuffCheck",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPopAllCharacterData,
        Params = {TargetVar = "Owner"}
      }
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
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurMana",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ManaCost",
          Src1VarTable = "InstanceVars",
          Src2Var = "CurMana",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
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
              Src1Var = "ManaCost",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = -1,
              DestVar = "NegMana",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "NegMana"
            }
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ManaCost",
          Src1VarTable = "InstanceVars",
          Src2Var = "ManaCostInc",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ManaCost",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
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
        Function = BBForEachUnitInTargetAreaRandom,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 625,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 3,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Unit",
                  OverrideCastPosition = false,
                  SlotNumber = 0,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = false,
                  FireWithoutCasting = true,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = false,
                  UpdateAutoAttackTimer = false
                }
              }
            }
          }
        }
      }
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainMetamorphism"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = 0.5}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SwainMetamorphism"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SwainMetamorphism"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCostInc",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            5,
            7,
            9
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCost",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            30,
            32,
            34
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            0,
            0,
            0
          },
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "swain_raven"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_metamorph.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_metamorph_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_demonform_idle.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainbeamtransition"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "swainmetamorphism"
    }
  }
}
