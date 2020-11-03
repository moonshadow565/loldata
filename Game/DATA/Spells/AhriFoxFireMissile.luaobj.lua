NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ahri_FoxFire.dds"
BuffName = "AhriFoxFire"
SpellDamageRatio = 1
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "AhriFoxFireMissile"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 0,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AhriFoxFire",
          ResetDuration = 0
        }
      }
    }
  }
}
SpellOnMissileUpdateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "Ready",
      Src1VarTable = "SpellVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Ready",
      DestVarTable = "SpellVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Ready",
      Src1VarTable = "SpellVars",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Count", SrcValue = 0}
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
        Function = BBForNClosestVisibleUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissilePosition",
          Range = 650,
          Flags = "AffectEnemies AffectHeroes ",
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
              OverrideCastPosition = true,
              OverrideCastPosVar = "MissilePosition",
              SlotNumber = 3,
              SlotType = ExtraSlots,
              OverrideForceLevel = 0,
              OverrideForceLevelVar = "Level",
              OverrideCoolDownCheck = true,
              FireWithoutCasting = true,
              UseAutoAttackSpell = false,
              ForceCastingOrChannelling = true,
              UpdateAutoAttackTimer = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Count", SrcValue = 1}
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "AhriFoxFireMissile",
              NumStacks = 1
            }
          }
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
            Function = BBForNClosestVisibleUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "MissilePosition",
              Range = 650,
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
                  OverrideCastPosition = true,
                  OverrideCastPosVar = "MissilePosition",
                  SlotNumber = 3,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = true,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = false
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
                }
              },
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "AhriFoxFireMissile",
                  NumStacks = 1
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
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    30,
                    60,
                    90,
                    120,
                    150
                  }
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatMagicDamageMod,
                  TargetVar = "Owner",
                  DestVar = "MyAP"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MyAP",
                  Src1Value = 0,
                  Src2Value = 0.3,
                  DestVar = "MyAPBonus",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BaseDamage",
                  Src2Var = "MyAPBonus",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "TotalDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBGetSpellBlock,
                Params = {
                  TargetVar = "Unit",
                  DestVar = "TheirSpellBlock"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TheirSpellBlock",
                  Src1Value = 0,
                  Src2Value = 100,
                  DestVar = "TheirSpellBlockPercent",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TheirSpellBlockPercent",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "TheirSpellBlockRatio",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AhriFoxFireMissileTwo"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "TotalDamage",
                      Src1Value = 0,
                      Src2Value = 2,
                      DestVar = "TotalDamage",
                      MathOp = MO_DIVIDE
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "AhriFoxFireMissileTagTwo"
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src1Var = "TotalDamage",
                          Src1Value = 0,
                          Src2Value = 1.5,
                          DestVar = "TotalDamage",
                          MathOp = MO_MULTIPLY
                        }
                      }
                    }
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalDamage",
                  Src2Var = "TheirSpellBlockRatio",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "ProjectedDamage",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "TheirHealth",
                  OwnerVar = "Unit",
                  Function = GetHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TheirHealth",
                  Src2Var = "ProjectedDamage",
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "AhriFoxFireMissileTag",
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
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "AhriFoxFireMissileTagTwo",
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrifoxfiremissiletag"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahrifoxfiremissiletagtwo"
    }
  }
}
