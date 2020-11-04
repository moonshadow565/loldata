NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "UrgotTerrorCapacitor.dds"
BuffName = "UrgotTerrorCapacitor"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
OnPreDamagePriority = 3
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
DoOnPreDamageInExpirationOrder = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Shield",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UrgotTerrorCapacitor_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
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
      DestVar = "SlowPercent",
      SrcValueByLevel = {
        20,
        25,
        30,
        35,
        40
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Shield",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "SlowPercent",
      Index = 2
    }
  },
  {
    Function = BBIncreaseShield,
    Params = {
      UnitVar = "Owner",
      AmountVar = "Shield",
      AmountVarTable = "InstanceVars",
      Amount = 0,
      MagicShield = true,
      PhysicalShield = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Shield",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBRemoveShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "Shield",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Target",
              Value2 = true,
              CompareOp = CO_IS_NOT_DEAD
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HitResult",
                  Value2 = HIT_Miss,
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBGetSlotSpellInfo,
                    Params = {
                      DestVar = "Level",
                      SpellSlotValue = 1,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      SlotType = SpellSlots,
                      OwnerVar = "Attacker",
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
                        -0.22,
                        -0.24,
                        -0.26,
                        -0.28
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
                      Duration = 1.5,
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
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "oldArmorAmount",
      DestVarTable = "InstanceVars",
      SrcVar = "Shield",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Shield",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Shield",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Shield",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "oldArmorAmount",
          Src1VarTable = "InstanceVars",
          Src2Var = "Shield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "oldArmorAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
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
          Src1Var = "DamageAmount",
          Src2Var = "Shield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Shield",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Shield",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
SelfExecuteBuildingBlocks = {
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
      DestVar = "ShieldAmount",
      SrcValueByLevel = {
        80,
        140,
        200,
        260,
        320
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ShieldAmount",
      Src2Var = "BonusShield",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Shield",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Shield",
      DestVarTable = "NextBuffVars",
      SrcVar = "Shield"
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
      Duration = 7,
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
      Name = "urgotterrorcapacitor_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
