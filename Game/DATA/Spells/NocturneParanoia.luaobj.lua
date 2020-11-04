NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoia"
AutoBuffActivateEffect = ""
SpellToggleSlot = 4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "NewCd",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Target,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = -100,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "VOSoundCreated",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_SelfAOE,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
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
      Src1Var = "Multiplier",
      Src2Var = "NewCd",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "NocturneParanoia",
      TargetVar = "Owner"
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
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = true
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "VOSoundCreated",
          Src1VarTable = "InstanceVars",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "VOSoundCreated",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "NocturneParanoiaVO",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 4,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = true
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
              Value2 = 100,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForEachChampion,
                Params = {
                  IteratorVar = "Unit",
                  Team = TEAM_UNKNOWN,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "NocturneParanoiaTargetOrderVO",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 4,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = true
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBForEachChampion,
                Params = {
                  IteratorVar = "Unit",
                  Team = TEAM_UNKNOWN,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "NocturneParanoiaTargetChaosVO",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 4,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = true
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
}
SelfExecuteBuildingBlocks = {
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
      Value2 = 100,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFadeInColorFadeEffect,
        Params = {
          ColorRed = 0,
          ColorGreen = 0,
          ColorBlue = 75,
          FadeTime = 1,
          MaxWeight = 0.3,
          SpecificToTeam = TEAM_ORDER
        }
      },
      {
        Function = BBFadeOutColorFadeEffect,
        Params = {FadeTime = 1, SpecificToTeam = TEAM_CHAOS}
      },
      {
        Function = BBFadeInColorFadeEffect,
        Params = {
          ColorRed = 75,
          ColorGreen = 0,
          ColorBlue = 0,
          FadeTime = 1,
          MaxWeight = 0.3,
          SpecificToTeam = TEAM_CHAOS
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBFadeInColorFadeEffect,
        Params = {
          ColorRed = 0,
          ColorGreen = 0,
          ColorBlue = 75,
          FadeTime = 1,
          MaxWeight = 0.3,
          SpecificToTeam = TEAM_CHAOS
        }
      },
      {
        Function = BBFadeOutColorFadeEffect,
        Params = {FadeTime = 1, SpecificToTeam = TEAM_ORDER}
      },
      {
        Function = BBFadeInColorFadeEffect,
        Params = {
          ColorRed = 75,
          ColorGreen = 0,
          ColorBlue = 0,
          FadeTime = 1,
          MaxWeight = 0.3,
          SpecificToTeam = TEAM_ORDER
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "NocturneParanoia"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UnlockAnimation",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell4b",
          ScaleTime = 1,
          TargetVar = "Owner",
          Loop = false,
          Blend = false,
          Lock = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NewCd",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            160,
            130,
            100,
            0,
            0
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "NocturneParanoia",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "NocturneParanoiaParticle",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.25,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Attacker"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SightReduction",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            -300,
            -300,
            -300
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SpellLevel",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            1,
            2,
            3
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = 100,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_ORDER,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "NocturneParanoiaStartOrderFriend.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "root",
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false
                }
              }
            }
          },
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_CHAOS,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "NocturneParanoiaStartOrderFoe.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "root",
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargeting",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTarget",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBApplyNearSight,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Duration = 4
                }
              }
            }
          },
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_UNKNOWN,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargetOrder",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              }
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_CHAOS,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "NocturneParanoiaStartChaosFriend.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "root",
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false
                }
              }
            }
          },
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_ORDER,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "NocturneParanoiaStartChaosFoe.troy",
                  Flags = 0,
                  EffectIDVar = "asdf",
                  BoneName = "root",
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargeting",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTarget",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              },
              {
                Function = BBApplyNearSight,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Duration = 4
                }
              }
            }
          },
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_UNKNOWN,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargetChaos",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              }
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoia"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargetordervo"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargetchaosvo"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiaparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiastartorderfriend.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiastartorderfoe.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargeting"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargetorder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiastartchaosfriend.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiastartchaosfoe.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargetchaos"
    }
  }
}
