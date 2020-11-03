NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "OrianaRedactTarget"
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OrianaGlobalCooldown",
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
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "OrianaRedactTarget",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Deployed", SrcValue = false}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamageBlock",
      SrcValueByLevel = {
        80,
        120,
        160,
        200,
        240
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "SelfAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SelfAP",
      Src1Value = 0,
      Src2Value = 0.6,
      DestVar = "BonusShield",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusShield",
      Src2Var = "BaseDamageBlock",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalShield",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "OrianaGhost",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaGhostSelf"
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaBlendDelay"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Deployed", SrcValue = true}
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Owner",
          BuffName = "OrianaGhost"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageBlock",
              DestVarTable = "NextBuffVars",
              SrcVar = "TotalShield"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "OrianaRedactShield",
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
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
            SubBlocks = {
              {
                Function = BBSetStatus,
                Params = {
                  TargetVar = "Unit",
                  SrcValue = true,
                  Status = SetNoRender
                }
              }
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Unit",
              BuffName = "OrianaGhost"
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OrianaBlendDelay"
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Unit", PositionVar = "CastPos"}
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Target", PositionVar = "TargetPos"}
          },
          {
            Function = BBDistanceBetweenPoints,
            Params = {
              DestVar = "MinDistance",
              Point1Var = "CastPos",
              Point2Var = "TargetPos"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "MinDistance",
              Value2 = 100,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageBlock",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TotalShield"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "OrianaRedactShield",
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
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Owner",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "OrianaGhost",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "OrianaGhostSelf",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageBlock",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TotalShield"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OrianaRedact",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Target",
                  PosVar = "Target",
                  EndPosVar = "Target",
                  OverrideCastPosition = true,
                  OverrideCastPosVar = "CastPos",
                  SlotNumber = 2,
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
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Deployed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "GhostAlive",
          Src1VarTable = "CharVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OrianaGhostSelf"
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {
              TargetVar = "Owner",
              BuffName = "OrianaBlendDelay"
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "CastPos"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OrianaRedact",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Target",
              PosVar = "Target",
              EndPosVar = "Target",
              OverrideCastPosition = true,
              OverrideCastPosVar = "CastPos",
              SlotNumber = 2,
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
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageBlock",
              DestVarTable = "NextBuffVars",
              SrcVar = "TotalShield"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OrianaRedactShield",
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
          }
        }
      }
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredacttarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaglobalcooldown"
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
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianablenddelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredactshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredact"
    }
  }
}
