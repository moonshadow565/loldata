TargetExecuteBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "buffDuration",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "UrgotPlasmaGrenade_tar.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Nothing",
      TargetPosVar = "TargetPos",
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
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AP"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "dmg",
      SrcValueByLevel = {
        100,
        155,
        210,
        265,
        320
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AP",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "dmg",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "buffDuration",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "remainder",
      MathOp = MO_MODULO
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "buffDuration",
      Src2Var = "remainder",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ticks",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalDamage",
      Src2Var = "ticks",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TickDamage",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorReduced",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -10,
        -15,
        -20,
        -25,
        -30
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 250,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Unit",
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
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TickDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "TickDamage"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "UrgotCorrosiveDebuff",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "buffDuration",
              TickRate = 0,
              CanMitigateDuration = true
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
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TickDamage",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TickDamage"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "UrgotCorrosiveDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "buffDuration",
                  TickRate = 0,
                  CanMitigateDuration = true
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
                  TargetVar = "Unit",
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
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "TickDamage",
                      DestVarTable = "NextBuffVars",
                      SrcVar = "TickDamage"
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Owner",
                      BuffName = "UrgotCorrosiveDebuff",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "buffDuration",
                      TickRate = 0,
                      CanMitigateDuration = true
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
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotplasmagrenade_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotcorrosivedebuff"
    }
  }
}
