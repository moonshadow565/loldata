BuffName = "RivenPassive"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 5, Index = 1}
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {Value = 3, Index = 3}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "AttackDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseAD"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackDamage",
          Src2Var = "BaseAD",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "AttackDamage",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "AttackDamage",
          Src1Value = 0.5,
          Src2Value = 0,
          DestVar = "PassiveAD",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "PassiveAD",
          Index = 2
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "RivenMartyr",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "RivenMartyr",
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
    Params = {
      Src1Var = "SpellName",
      Value2 = "RivenFengShuiEngine",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "AttackDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "BaseAD"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackDamage",
          Src2Var = "BaseAD",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "AttackDamage",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "AttackDamage",
          Src1Value = 0.6,
          Src2Value = 0,
          DestVar = "PassiveAD",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "PassiveAD",
          Index = 2
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoesntTriggerSpellCasts",
      Src1VarTable = "SpellVars",
      Value2 = true,
      CompareOp = CO_EQUAL
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
          BuffName = "RivenPassiveAABoost",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 3,
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
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Owner",
      BuffName = "RivenPassiveAABoost"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBGetLevel,
                Params = {TargetVar = "Owner", DestVar = "Level"}
              },
              {
                Function = BBGetTotalAttackDamage,
                Params = {
                  TargetVar = "Owner",
                  DestVar = "AttackDamage"
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetBaseAttackDamage,
                  TargetVar = "Owner",
                  DestVar = "BaseAD"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AttackDamage",
                  Src2Var = "BaseAD",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "AttackDamage",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "AttackDamage",
                  Src1Value = 0.5,
                  Src2Value = 0,
                  DestVar = "PassiveAD",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    5,
                    5,
                    5,
                    7,
                    7,
                    7,
                    9,
                    9,
                    9,
                    11,
                    11,
                    11,
                    13,
                    13,
                    13,
                    15,
                    15,
                    15,
                    15
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "PassiveAD",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BonusDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "BonusDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 1,
                  CompareOp = CO_GREATER_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "RivenPassiveAABoost",
                      ResetDuration = 5
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffClear,
                    Params = {
                      TargetVar = "Owner",
                      BuffName = "RivenPassiveAABoost"
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
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmp",
      SrcValueByLevel = {
        5,
        5,
        5,
        7,
        7,
        7,
        9,
        9,
        9,
        11,
        11,
        11,
        13,
        13,
        13,
        15,
        15,
        15,
        15
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "DamageAmp",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenmartyr"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenpassiveaaboost"
    }
  }
}
