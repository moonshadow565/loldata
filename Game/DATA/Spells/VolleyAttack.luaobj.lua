NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SpellDamageRatio = 0.5
TriggersSpellCasts = false
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      CasterVar = "Target",
      BuffName = "VolleyAttack"
    }
  },
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
              EffectName = "bowmaster_BasicAttack_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Target",
              BuffName = "VolleyAttack",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 9,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
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
                40,
                50,
                60,
                70,
                80
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
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "BaseDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
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
            Function = BBIf,
            Params = {
              Src1Var = "Level",
              Value2 = 1,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MovementSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    -0.15,
                    -0.2,
                    -0.25,
                    -0.3,
                    -0.35
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "FrostArrow",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              }
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
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
                  EffectName = "bowmaster_BasicAttack_tar.troy",
                  Flags = 0,
                  EffectIDVar = "part",
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Target",
                  BuffName = "VolleyAttack",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 9,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
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
                    40,
                    50,
                    60,
                    70,
                    80
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
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "BaseDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
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
                Function = BBIf,
                Params = {
                  Src1Var = "Level",
                  Value2 = 1,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MovementSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValueByLevel = {
                        -0.15,
                        -0.2,
                        -0.25,
                        -0.3,
                        -0.35
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "FrostArrow",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Slow,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 2,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
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
                      EffectName = "bowmaster_BasicAttack_tar.troy",
                      Flags = 0,
                      EffectIDVar = "part",
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Target",
                      BuffName = "VolleyAttack",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 9,
                      NumberOfStacks = 1,
                      Duration = 0.5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
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
                        40,
                        50,
                        60,
                        70,
                        80
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
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "BaseDamage",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
                    Function = BBIf,
                    Params = {
                      Src1Var = "Level",
                      Value2 = 1,
                      CompareOp = CO_GREATER_THAN_OR_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "MovementSpeedMod",
                          DestVarTable = "NextBuffVars",
                          SrcValueByLevel = {
                            -0.15,
                            -0.2,
                            -0.25,
                            -0.3,
                            -0.35
                          }
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "FrostArrow",
                          BuffAddType = BUFF_RENEW_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_Slow,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 2,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      }
                    }
                  },
                  {
                    Function = BBDestroyMissile,
                    Params = {
                      MissileIDVar = "MissileNetworkID"
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volleyattack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bowmaster_basicattack_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
