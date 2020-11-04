TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
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
            Function = BBGetTotalAttackDamage,
            Params = {
              TargetVar = "Owner",
              DestVar = "AttackDamage"
            }
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              BuffName = "EmpowerCleave"
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
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamagePerStack",
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
                Function = BBMath,
                Params = {
                  Src1Var = "DamagePerStack",
                  Src2Var = "Count",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "EmpowerBonus",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "Count",
                  Src1Value = 125,
                  Src2Value = 0,
                  DestVar = "RadiusOfCleave",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AttackDamage",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "AoEDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBForEachUnitInTargetArea,
                Params = {
                  AttackerVar = "Owner",
                  CenterVar = "Target",
                  Range = 0,
                  RangeVar = "RadiusOfCleave",
                  Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
                  IteratorVar = "Unit"
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "Target",
                      Src2Var = "Unit",
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "AoEDamage",
                          DamageType = MAGIC_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_PROC,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
                        }
                      }
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Empower"
                }
              },
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "EmpowerCleave",
                  NumStacks = 0
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "EmpowerBonus",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetBaseAttackDamage,
              TargetVar = "Owner",
              DestVar = "BaseAttackDamage"
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "BaseAttackDamage",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_ATTACK,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 3,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Target",
              DamageByLevel = {
                140,
                170,
                210
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "RelentlessAssaultDebuff",
              NumStacks = 0
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "RelentlessAssault_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true
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
      Name = "empowercleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "empower"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "relentlessassaultdebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "relentlessassault_tar.troy"
    }
  }
}
