NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Vayne_SilveredBolts.dds"
BuffName = "VayneSilverBolts"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
PersistsThroughDeath = true
SpellFXOverrideSkins = {""}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsBlinded",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = True}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
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
                        Function = BBGetBuffCountFromCaster,
                        Params = {
                          DestVar = "Count",
                          TargetVar = "Target",
                          CasterVar = "Attacker",
                          BuffName = "VayneSilveredDebuff"
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Count",
                          Value2 = 2,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBGetTeamID,
                            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
                          },
                          {
                            Function = BBGetTeamID,
                            Params = {
                              TargetVar = "Target",
                              DestVar = "TeamIDTarget"
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Nothing",
                              PosVar = "Target",
                              EffectName = "vayne_W_tar.troy",
                              Flags = 0,
                              EffectIDVar = "gragas",
                              TargetObjectVar = "Target",
                              SpecificUnitOnlyVar = "Target",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true,
                              PersistsThroughReconnect = false,
                              BindFlexToOwnerPAR = false,
                              FollowsGroundTilt = false,
                              FacesTarget = false
                            }
                          },
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
                            Function = BBGetStat,
                            Params = {
                              Stat = GetFlatMagicDamageMod,
                              TargetVar = "Attacker",
                              DestVar = "AbilityPower"
                            }
                          },
                          {
                            Function = BBMath,
                            Params = {
                              Src2Var = "AbilityPower",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "BonusMaxHealthDamage",
                              MathOp = MO_MULTIPLY
                            }
                          },
                          {
                            Function = BBSpellBuffClear,
                            Params = {
                              TargetVar = "Target",
                              BuffName = "VayneSilveredDebuff"
                            }
                          },
                          {
                            Function = BBGetPAROrHealth,
                            Params = {
                              DestVar = "TarMaxHealth",
                              OwnerVar = "Target",
                              Function = GetMaxHealth,
                              PARType = PAR_MANA
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "RankScaling",
                              SrcValueByLevel = {
                                0.04,
                                0.05,
                                0.06,
                                0.07,
                                0.08
                              }
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "FlatScaling",
                              SrcValueByLevel = {
                                20,
                                30,
                                40,
                                50,
                                60
                              }
                            }
                          },
                          {
                            Function = BBMath,
                            Params = {
                              Src1Var = "RankScaling",
                              Src2Var = "BonusMaxHealthDamage",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "RankScaling",
                              MathOp = MO_ADD
                            }
                          },
                          {
                            Function = BBMath,
                            Params = {
                              Src1Var = "TarMaxHealth",
                              Src2Var = "RankScaling",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "DamageToDeal",
                              MathOp = MO_MULTIPLY
                            }
                          },
                          {
                            Function = BBMath,
                            Params = {
                              Src1Var = "DamageToDeal",
                              Src2Var = "FlatScaling",
                              Src1Value = 0,
                              Src2Value = 0,
                              DestVar = "DamageToDeal",
                              MathOp = MO_ADD
                            }
                          },
                          {
                            Function = BBIf,
                            Params = {
                              Src1Var = "TeamIDTarget",
                              Value2 = TEAM_NEUTRAL,
                              CompareOp = CO_EQUAL
                            },
                            SubBlocks = {
                              {
                                Function = BBMath,
                                Params = {
                                  Src1Var = "DamageToDeal",
                                  Src1Value = 0,
                                  Src2Value = 200,
                                  DestVar = "DamageToDeal",
                                  MathOp = MO_MIN
                                }
                              }
                            }
                          },
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Target",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageType = TRUE_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_PROC,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 1,
                              IgnoreDamageIncreaseMods = false,
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
                            Function = BBSpellBuffAdd,
                            Params = {
                              TargetVar = "Target",
                              AttackerVar = "Attacker",
                              BuffName = "VayneSilveredDebuff",
                              BuffAddType = BUFF_STACKS_AND_RENEWS,
                              StacksExclusive = true,
                              BuffType = BUFF_CombatDehancer,
                              MaxStack = 3,
                              NumberOfStacks = 1,
                              Duration = 3.5,
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynesilvereddebuff"
    }
  }
}
