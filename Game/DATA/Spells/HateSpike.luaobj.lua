DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Tristana_headshot.dds"
BuffName = "Rapid Fire"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
TriggersSpellCasts = true
CanCastBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "temp", SrcValue = false}
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 370,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "temp", SrcValue = true}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "temp",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ValidTargets",
      SrcValue = false
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 375,
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
          PosVar = "Owner",
          EndPosVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 1,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainCount",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainPercent",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.1,
            0.125,
            0.15,
            0.175,
            0.2
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "HateSpikeDrain",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.01,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ValidTargets",
          SrcValue = true
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ValidTargets",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LowestHPPercent",
              SrcValue = 1.01
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "FoundUnit", SrcValue = false}
          },
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 375,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Other3",
              MaximumUnitsToPick = 5,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "HealthCandidate",
                  OwnerVar = "Other3",
                  Function = GetHealthPercent,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HealthCandidate",
                  Src2Var = "LowestHPPercent",
                  CompareOp = CO_LESS_THAN
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Unit",
                      Src2Var = "Other3",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "LowestHPPercent",
                          SrcVar = "HealthCandidate"
                        }
                      },
                      {
                        Function = BBSetUnit,
                        Params = {SrcVar = "Other3", DestVar = "Other1"}
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {DestVar = "FoundUnit", SrcValue = true}
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
              Src1Var = "FoundUnit",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Other1",
                  Src2Var = "Unit",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellCast,
                    Params = {
                      CasterVar = "Owner",
                      TargetVar = "Other1",
                      PosVar = "Owner",
                      EndPosVar = "Owner",
                      OverrideCastPosition = false,
                      SlotNumber = 1,
                      SlotType = ExtraSlots,
                      OverrideForceLevel = 0,
                      OverrideForceLevelVar = "Level",
                      OverrideCoolDownCheck = true,
                      FireWithoutCasting = true,
                      UseAutoAttackSpell = false,
                      ForceCastingOrChannelling = false,
                      UpdateAutoAttackTimer = false
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
                Params = {DestVar = "FoundUnit", SrcValue = false}
              },
              {
                Function = BBForEachUnitInTargetAreaRandom,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Owner",
                  Range = 375,
                  Flags = "AffectEnemies AffectNeutral AffectMinions ",
                  IteratorVar = "Other3",
                  MaximumUnitsToPick = 2,
                  InclusiveBuffFilter = true
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Other3",
                      Src2Var = "Unit",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSetUnit,
                        Params = {SrcVar = "Other3", DestVar = "Other1"}
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {DestVar = "FoundUnit", SrcValue = true}
                      }
                    }
                  }
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "FoundUnit",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellCast,
                    Params = {
                      CasterVar = "Owner",
                      TargetVar = "Other1",
                      PosVar = "Owner",
                      EndPosVar = "Owner",
                      OverrideCastPosition = false,
                      SlotNumber = 1,
                      SlotType = ExtraSlots,
                      OverrideForceLevel = 0,
                      OverrideForceLevelVar = "Level",
                      OverrideCoolDownCheck = true,
                      FireWithoutCasting = true,
                      UseAutoAttackSpell = false,
                      ForceCastingOrChannelling = false,
                      UpdateAutoAttackTimer = false
                    }
                  }
                }
              },
              {
                Function = BBElseIf,
                Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_DEAD},
                SubBlocks = {
                  {
                    Function = BBSpellCast,
                    Params = {
                      CasterVar = "Owner",
                      TargetVar = "Unit",
                      PosVar = "Owner",
                      EndPosVar = "Owner",
                      OverrideCastPosition = false,
                      SlotNumber = 2,
                      SlotType = ExtraSlots,
                      OverrideForceLevel = 0,
                      OverrideForceLevelVar = "Level",
                      OverrideCoolDownCheck = true,
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hatespikedrain"
    }
  }
}
