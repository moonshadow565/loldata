NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "LeblancConjureChains.dds"
BuffName = "LeblancShackleBeam"
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
PopupMessage1 = "game_floatingtext_Snared"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BreakStun",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Broken",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "leBlanc_shackle_chain_beam.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "root",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
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
      BindObjectVar = "Attacker",
      EffectName = "leBlanc_shackle_self_idle.troy",
      Flags = 0,
      EffectIDVar = "SoulShackleIdle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "C_BUFFBONE_GLB_CENTER_LOC",
      TargetObjectVar = "Attacker",
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
      EffectName = "leBlanc_shackle_target_idle.troy",
      Flags = 0,
      EffectIDVar = "SoulShackleTarget",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
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
      EffectName = "leBlanc_shackle_tar_blood.troy",
      Flags = 0,
      EffectIDVar = "SoulShackleTarget_blood",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LeblancVisionBubble",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TeamOrderID",
          SrcValue = TEAM_ORDER
        }
      },
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "TeamOrderID",
          Radius = 10,
          TargetVar = "Attacker",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "a",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LeblancVisionBubble",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_CHAOS,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TeamChaosID",
          SrcValue = TEAM_CHAOS
        }
      },
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "TeamChaosID",
          Radius = 10,
          TargetVar = "Attacker",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "a",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LeblancVisionBubble",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleIdle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleTarget",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "SoulShackleTarget_blood",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LeblancVisionBubble",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBRemovePerceptionBubble,
        Params = {
          BubbleIDVar = "a",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Broken",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "LeblancChaosOrbM"
        },
        SubBlocks = {
          {
            Function = BBApplySilence,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 2
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "LeblancChaosOrbM"
            }
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
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 1,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Attacker",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  DamageByLevel = {
                    22,
                    44,
                    66,
                    88,
                    110
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.33,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "Level",
              Value2 = 2,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Attacker",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  DamageByLevel = {
                    25,
                    50,
                    75,
                    100,
                    125
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.375,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Attacker",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  DamageByLevel = {
                    28,
                    56,
                    84,
                    112,
                    140
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.42,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "LeblancChaosOrb"
        },
        SubBlocks = {
          {
            Function = BBApplySilence,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 2
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "LeblancChaosOrb"
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Attacker",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Owner",
              DamageByLevel = {
                20,
                40,
                60,
                80,
                100
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.3,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "BreakDamage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.4,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "LeblancSoulShackleNet",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Snare,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "BreakStun",
          DurationVarTable = "InstanceVars",
          TickRate = 0,
          CanMitigateDuration = false
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
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Broken",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "Slow"
            }
          },
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
            Function = BBIf,
            Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Broken",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "Slow"
                }
              },
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
                Function = BBDistanceBetweenObjects,
                Params = {
                  DestVar = "Distance",
                  ObjectVar1 = "Owner",
                  ObjectVar2 = "Attacker"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Distance",
                  Value2 = 865,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "Broken",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Attacker",
                      BuffName = "Slow"
                    }
                  },
                  {
                    Function = BBSpellBuffRemoveCurrent,
                    Params = {TargetVar = "Owner"}
                  }
                }
              }
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
      DestVar = "BreakDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        40,
        65,
        90,
        115,
        140
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BreakStun",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        1,
        1.3,
        1.6,
        1.9,
        2.2
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Broken",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "LeblancSoulShackle",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BreakDamage",
      DamageVarTable = "NextBuffVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLPERSIST,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.4,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.25,
        -0.25,
        -0.25,
        -0.25,
        -0.25
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Slow",
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 100,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBDestroyMissile,
    Params = {
      MissileIDVar = "MissileNetworkID"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "LeblancChaosOrbM"
    },
    SubBlocks = {
      {
        Function = BBApplySilence,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 2
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "LeblancChaosOrbM"
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
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                22,
                44,
                66,
                88,
                110
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.33,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Level",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                25,
                50,
                75,
                100,
                125
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.375,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                28,
                56,
                84,
                112,
                140
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.42,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "LeblancChaosOrb"
    },
    SubBlocks = {
      {
        Function = BBApplySilence,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          Duration = 2
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "LeblancChaosOrb"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            20,
            40,
            60,
            80,
            100
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.3,
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
      Name = "leblanc_shackle_chain_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_self_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_target_idle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_shackle_tar_blood.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorb"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshacklenet"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancsoulshackle"
    }
  }
}
