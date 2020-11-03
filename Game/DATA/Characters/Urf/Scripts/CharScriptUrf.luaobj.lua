UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "HalloweenUrfCD"
        },
        SubBlocks = {
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 300,
              Flags = "AffectEnemies AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "EternalThirstIcon"
                },
                SubBlocks = {
                  {
                    Function = BBGetSkinID,
                    Params = {UnitVar = "Unit", SkinIDVar = "WarwickID"}
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "WarwickID",
                      Value2 = 2,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Owner",
                          TargetVar = "Unit",
                          EndPosVar = "Unit",
                          OverrideCastPosition = false,
                          SlotNumber = 0,
                          SlotType = SpellSlots,
                          OverrideForceLevel = 1,
                          OverrideCoolDownCheck = false,
                          FireWithoutCasting = false,
                          UseAutoAttackSpell = false,
                          ForceCastingOrChannelling = false,
                          UpdateAutoAttackTimer = false
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "HalloweenUrfWarwick",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 4.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
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
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "HalloweenUrfAppear",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 6.25,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "HalloweenUrfAppear",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 6.25,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
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
CharOnActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "halloweenurfcd"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "eternalthirsticon"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "halloweenurfwarwick"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "halloweenurfappear"
    }
  }
}
