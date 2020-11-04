NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jester_DeathWard.dds"
BuffName = "Jack In The Box"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "ScriptName",
          Value2 = "globalwallpush",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Net,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Sleep,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Snare,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Stun,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Taunt,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Blind,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Suppression,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_CombatDehancer,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
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
        Function = BBIf,
        Params = {
          Src1Var = "MaxStack",
          Value2 = 76,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = false}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 2,
      IDVar = "ID",
      IDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "FearDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
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
          PosVar = "TargetPos",
          EffectName = "jackintheboxpoof.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 100,
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
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "TargetPos",
          EffectName = "jackintheboxpoof.troy",
          Flags = 0,
          EffectIDVar = "a",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 100,
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 1000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "LifeTime",
      Value2 = 2,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "EndKill"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "Stealth"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Stealth",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 90,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBForNClosestVisibleUnitsInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 300,
              Flags = "AffectEnemies AffectNeutral AffectBuildings AffectMinions AffectHeroes AffectTurrets ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Caster"}
              },
              {
                Function = BBPushCharacterFade,
                Params = {
                  TargetVar = "Owner",
                  FadeAmount = 1,
                  fadeTime = 0.1,
                  IDVar = "ID",
                  IDVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "JackInTheBoxDamageSensor",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = false,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 5,
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
                  BuffName = "EndKill",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Stealth",
                  ResetDuration = 0
                }
              },
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "Owner",
                  Range = 400,
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
                    Function = BBApplyAssistMarker,
                    Params = {
                      Duration = 10,
                      TargetVar = "Unit",
                      SourceVar = "Caster"
                    }
                  },
                  {
                    Function = BBApplyFear,
                    Params = {
                      AttackerVar = "Caster",
                      TargetVar = "Unit",
                      Duration = 0,
                      DurationVar = "FearDuration",
                      DurationVarTable = "InstanceVars"
                    }
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
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Endkill"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "unitFound", SrcValue = 0}
          },
          {
            Function = BBForNClosestVisibleUnitsInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 400,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "JackInTheBoxHardLock",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Unit",
                  OverrideCastPosition = false,
                  SlotNumber = 0,
                  SlotType = SpellSlots,
                  OverrideForceLevel = 1,
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "unitFound", SrcValue = 1}
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Stealth",
                  ResetDuration = 0
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "unitFound",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForNClosestVisibleUnitsInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "Owner",
                  Range = 400,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1,
                  BuffNameFilter = "JackInTheBoxSoftLock",
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "JackInTheBoxSoftLock"
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Owner",
                          TargetVar = "Unit",
                          OverrideCastPosition = false,
                          SlotNumber = 0,
                          SlotType = SpellSlots,
                          OverrideForceLevel = 1,
                          OverrideCoolDownCheck = true,
                          FireWithoutCasting = false,
                          UseAutoAttackSpell = false,
                          ForceCastingOrChannelling = true,
                          UpdateAutoAttackTimer = false
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {DestVar = "unitFound", SrcValue = 1}
                      },
                      {
                        Function = BBSpellBuffRemove,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "Stealth",
                          ResetDuration = 0
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
              Src1Var = "unitFound",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForNClosestVisibleUnitsInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "Owner",
                  Range = 400,
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBSpellCast,
                    Params = {
                      CasterVar = "Owner",
                      TargetVar = "Unit",
                      OverrideCastPosition = false,
                      SlotNumber = 0,
                      SlotType = SpellSlots,
                      OverrideForceLevel = 1,
                      OverrideCoolDownCheck = true,
                      FireWithoutCasting = false,
                      UseAutoAttackSpell = false,
                      ForceCastingOrChannelling = true,
                      UpdateAutoAttackTimer = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "unitFound", SrcValue = 1}
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "Stealth",
                      ResetDuration = 0
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Unit",
                          AttackerVar = "Owner",
                          BuffName = "JackInTheBoxSoftLock",
                          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                          StacksExclusive = false,
                          BuffType = BUFF_Internal,
                          MaxStack = 20,
                          NumberOfStacks = 1,
                          Duration = 5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
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
              Src1Var = "unitFound",
              Value2 = 0,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBForNClosestVisibleUnitsInTargetArea,
                Params = {
                  AttackerVar = "Attacker",
                  CenterVar = "Owner",
                  Range = 400,
                  Flags = "AffectEnemies AffectBuildings AffectTurrets ",
                  IteratorVar = "Unit",
                  MaximumUnitsToPick = 1,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBSpellCast,
                    Params = {
                      CasterVar = "Owner",
                      TargetVar = "Unit",
                      OverrideCastPosition = false,
                      SlotNumber = 0,
                      SlotType = SpellSlots,
                      OverrideForceLevel = 1,
                      OverrideCoolDownCheck = true,
                      FireWithoutCasting = false,
                      UseAutoAttackSpell = false,
                      ForceCastingOrChannelling = true,
                      UpdateAutoAttackTimer = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "unitFound", SrcValue = 1}
                  },
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "Stealth",
                      ResetDuration = 0
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
BuffOnPreMitigationDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_TURRET},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Stealth"
        },
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Attacker",
              TargetVar = "Owner",
              ResultVar = "canSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "canSee",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcValue = 0
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
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusHealth",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0,
        100,
        200,
        300,
        400
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FearDuration",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.75,
        1,
        1.25,
        1.5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "JackInTheBoxInternal",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.1,
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
      Name = "jackintheboxpoof.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "stealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxdamagesensor"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "endkill"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxsoftlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxinternal"
    }
  }
}
