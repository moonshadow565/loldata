NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Armordillo_Powerball.dds"
BuffName = "PowerBall"
AutoBuffActivateEffect = "ArmordilloSpin.troy"
AutoBuffActivateEffect2 = "Powerball_buf.troy"
SpellToggleSlot = 1
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AoEDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlowPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "Armordillo_PB",
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "ReductionPerc"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ReductionPerc",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "ReductionPerc",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ReductionPerc",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "CooldownTime",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBPopAllCharacterData,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "PowerBallStop.troy",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "CooldownTime",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
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
        Function = BBMath,
        Params = {
          Src1Var = "MoveSpeedMod",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "MoveSpeedMod",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
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
        Function = BBSetVarInTable,
        Params = {DestVar = "collide", SrcValue = false}
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 160,
          Flags = "AffectEnemies AffectNeutral AffectMinions ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Unit",
              DestVar = "IsStealthed",
              Status = GetStealthed
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "IsStealthed",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "collide", SrcValue = true}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "collide", SrcValue = true}
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
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
                        Function = BBSetVarInTable,
                        Params = {DestVar = "collide", SrcValue = true}
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 200,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Unit",
              DestVar = "IsStealthed",
              Status = GetStealthed
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "IsStealthed",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "collide", SrcValue = true}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "collide", SrcValue = true}
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
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
                        Function = BBSetVarInTable,
                        Params = {DestVar = "collide", SrcValue = true}
                      }
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
        Params = {
          Src1Var = "collide",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyRoot,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 0.5
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 325,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Other1",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "PowerballHit.troy",
                  Flags = 0,
                  EffectIDVar = "A",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Other1"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SlowPercent",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "SlowPercent",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Other1",
                  Damage = 0,
                  DamageVar = "AoEDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Other1",
                  AttackerVar = "Attacker",
                  BuffName = "PowerBallSlow",
                  BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 3,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Other1",
                  AttackerVar = "Attacker",
                  BuffName = "PowerballStun",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Stun,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "ReductionPerc"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ReductionPerc",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "ReductionPerc",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ReductionPerc",
      Src1Value = 10,
      Src2Value = 0,
      DestVar = "CooldownTime",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PowerBall"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PowerBall"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "CooldownTime",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetCanAttack
        }
      },
      {
        Function = BBPopAllCharacterData,
        Params = {TargetVar = "Owner"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "PowerBallStop.troy",
          Flags = 0,
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
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
          DestVar = "AoEDamage",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            100,
            150,
            200,
            250,
            300
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SlowPercent",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            -0.2,
            -0.25,
            -0.3,
            -0.35,
            -0.4
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.025,
            0.025,
            0.025,
            0.025,
            0.025
          }
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "CasterID",
          DestVarTable = "NextBuffVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "PowerBall",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 8,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "armordillo_pb"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballstop.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "powerballhit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerballslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerballstun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "powerball"}
  }
}
