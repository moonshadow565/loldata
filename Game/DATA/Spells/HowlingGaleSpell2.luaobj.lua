NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
AutoBuffActivateEffect2 = ""
BuffOnSpellHitBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
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
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Attacker"}
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Target",
          DamageByLevel = {
            100,
            135,
            170,
            205,
            340
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.75,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBGetRandomPointInAreaUnit,
        Params = {
          TargetVar = "Target",
          Radius = 100,
          InnerRadius = 100,
          ResultVar = "BouncePos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Position",
          DestVarTable = "NextBuffVars",
          SrcVar = "BouncePos"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Speed",
          DestVarTable = "NextBuffVars",
          SrcValue = 100
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Gravity",
          DestVarTable = "NextBuffVars",
          SrcValue = 20
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Move",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
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
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Attacker"}
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              DamageByLevel = {
                110,
                150,
                190,
                230,
                270
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.75,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBGetRandomPointInAreaUnit,
            Params = {
              TargetVar = "Target",
              Radius = 100,
              InnerRadius = 100,
              ResultVar = "BouncePos"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Position",
              DestVarTable = "NextBuffVars",
              SrcVar = "BouncePos"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Speed",
              DestVarTable = "NextBuffVars",
              SrcValue = 100
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Gravity",
              DestVarTable = "NextBuffVars",
              SrcValue = 20
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "Move",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Attacker"}
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  DamageByLevel = {
                    110,
                    150,
                    190,
                    230,
                    270
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.75,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBGetRandomPointInAreaUnit,
                Params = {
                  TargetVar = "Target",
                  Radius = 100,
                  InnerRadius = 100,
                  ResultVar = "BouncePos"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Position",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "BouncePos"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Speed",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 100
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Gravity",
                  DestVarTable = "NextBuffVars",
                  SrcValue = 20
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "Move",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
    Params = {Name = "move"}
  }
}
