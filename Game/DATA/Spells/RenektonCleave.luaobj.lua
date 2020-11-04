NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "RagePercent",
      OwnerVar = "Owner",
      Function = GetPARPercent,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "HealthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonUnlockAnimationCleave",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.24,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell1",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = false,
      Lock = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FuryGainIncrement",
      SrcValue = 0,
      SrcValueByLevel = {
        5,
        5,
        5,
        5,
        5
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "FuryGain", SrcValue = 0}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        60,
        90,
        120,
        150,
        180
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "WeaponDamage"
    }
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
    Function = BBMath,
    Params = {
      Src1Var = "WeaponDamage",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "WeaponDamage",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "WeaponDamage",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "WeaponDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "WeaponDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "RangeVar", SrcValue = 400}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RenektonReignOfTheTyrant"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "RangeVar",
          Src1Value = 1.2,
          Src2Value = 0,
          DestVar = "RangeVar",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "RagePercent",
      Value2 = 0.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "renektoncleave_trail_rage.troy ",
          Flags = 0,
          EffectIDVar = "c",
          BoneName = "spine",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 0,
          RangeVar = "RangeVar",
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "ShouldHit", SrcValue = true}
          },
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "Visible"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Visible",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "ShouldHit", SrcValue = false}
                  }
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "ShouldHit",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DrainPercent",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 0.15
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MaxDrain",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    150,
                    225,
                    300,
                    375,
                    450
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "RenektonCleaveDrain",
                  BuffAddType = BUFF_RENEW_EXISTING,
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
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Visible",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "RenektonBloodSplatterTarget",
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
                  }
                }
              },
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1.5,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = true,
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
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1.5,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = true,
                      IgnoreDamageCrit = false
                    }
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = -50,
          PARType = PAR_OTHER
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "RenektonRageReady"
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
          EffectName = "renektoncleave_trail.troy ",
          Flags = 0,
          EffectIDVar = "c",
          BoneName = "spine",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 0,
          RangeVar = "RangeVar",
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "ShouldHit", SrcValue = true}
          },
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "Visible"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Visible",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "ShouldHit", SrcValue = false}
                  }
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "ShouldHit",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DrainPercent",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 0.075
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MaxDrain",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    50,
                    75,
                    100,
                    125,
                    150
                  }
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "RenektonCleaveDrain",
                  BuffAddType = BUFF_RENEW_EXISTING,
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
                Function = BBIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = true,
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
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDeal",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = true,
                      IgnoreDamageCrit = false
                    }
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "FuryGain",
                  Src2Var = "FuryGainIncrement",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "FuryGain",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "FuryGain",
                  Src1Value = 0,
                  Src2Value = 25,
                  DestVar = "FuryGain",
                  MathOp = MO_MIN
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Visible",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "RenektonBloodSplatterTarget",
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
                  }
                }
              }
            }
          }
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_OTHER,
          DeltaVar = "FuryGain"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "HealthPercent",
          Src2Var = "RageThreshold",
          Src2VarTable = "CharVars",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "FuryGain",
              Src1Value = 0.5,
              Src2Value = 0,
              DestVar = "FuryGain",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_OTHER,
              DeltaVar = "FuryGain"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "RenektonCleaveDrain"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimationcleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonreignofthetyrant"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektoncleave_trail_rage.troy "
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektoncleavedrain"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonrageready"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektoncleave_trail.troy "
    }
  }
}
