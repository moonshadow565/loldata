NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      CasterVar = "Target",
      BuffName = "TalonRakeMissileTwo"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "OwnerTeam"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Target", DestVar = "TargetTeam"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetTeam",
      Src2Var = "OwnerTeam",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetStatus,
            Params = {
              TargetVar = "Target",
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
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  PosVar = "Target",
                  EffectName = "talon_w_tar.troy",
                  Flags = 0,
                  EffectIDVar = "part",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Target",
                  BuffName = "TalonRakeMissileTwo",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1,
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
                Function = BBGetStat,
                Params = {
                  Stat = GetBaseAttackDamage,
                  TargetVar = "Owner",
                  DestVar = "BaseDamage"
                }
              },
              {
                Function = BBGetTotalAttackDamage,
                Params = {TargetVar = "Owner", DestVar = "TotalAD"}
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalAD",
                  Src2Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BaseDamage",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0.6,
                  DestVar = "BaseDamage",
                  MathOp = MO_MULTIPLY
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
                  DestVar = "BonusDamage",
                  SrcValueByLevel = {
                    30,
                    55,
                    80,
                    105,
                    130
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "BonusDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BaseDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "BaseDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
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
                  DestVar = "MoveSpeedMod",
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "TalonSlow",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
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
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      PosVar = "Target",
                      EffectName = "talon_w_tar.troy",
                      Flags = 0,
                      EffectIDVar = "part",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Target",
                      BuffName = "TalonRakeMissileTwo",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
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
                    Function = BBGetStat,
                    Params = {
                      Stat = GetBaseAttackDamage,
                      TargetVar = "Owner",
                      DestVar = "BaseDamage"
                    }
                  },
                  {
                    Function = BBGetTotalAttackDamage,
                    Params = {TargetVar = "Owner", DestVar = "TotalAD"}
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "TotalAD",
                      Src2Var = "BaseDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "BaseDamage",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1Value = 0,
                      Src2Value = 0.6,
                      DestVar = "BaseDamage",
                      MathOp = MO_MULTIPLY
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
                      DestVar = "BonusDamage",
                      SrcValueByLevel = {
                        30,
                        55,
                        80,
                        105,
                        130
                      }
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src2Var = "BonusDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "BaseDamage",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "BaseDamage",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
                      DestVar = "MoveSpeedMod",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "TalonSlow",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Slow,
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
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBCanSeeTarget,
                    Params = {
                      ViewerVar = "Owner",
                      TargetVar = "Target",
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
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Target",
                          PosVar = "Target",
                          EffectName = "talon_w_tar.troy",
                          Flags = 0,
                          EffectIDVar = "part",
                          TargetObjectVar = "Target",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Target",
                          BuffName = "TalonRakeMissileTwo",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_Internal,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 1,
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
                        Function = BBGetStat,
                        Params = {
                          Stat = GetBaseAttackDamage,
                          TargetVar = "Owner",
                          DestVar = "BaseDamage"
                        }
                      },
                      {
                        Function = BBGetTotalAttackDamage,
                        Params = {TargetVar = "Owner", DestVar = "TotalAD"}
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "TotalAD",
                          Src2Var = "BaseDamage",
                          Src1Value = 0,
                          Src2Value = 0,
                          DestVar = "BaseDamage",
                          MathOp = MO_SUBTRACT
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "BaseDamage",
                          Src1Value = 0,
                          Src2Value = 0.6,
                          DestVar = "BaseDamage",
                          MathOp = MO_MULTIPLY
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
                          DestVar = "BonusDamage",
                          SrcValueByLevel = {
                            30,
                            55,
                            80,
                            105,
                            130
                          }
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "BaseDamage",
                          Src2Var = "BonusDamage",
                          Src1Value = 0,
                          Src2Value = 0,
                          DestVar = "BaseDamage",
                          MathOp = MO_ADD
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Owner",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Target",
                          Damage = 0,
                          DamageVar = "BaseDamage",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          PhysicalDamageRatio = 0,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
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
                          DestVar = "MoveSpeedMod",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "TalonSlow",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Slow,
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
    Function = BBElseIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemissiletwo"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "talonslow"}
  }
}
