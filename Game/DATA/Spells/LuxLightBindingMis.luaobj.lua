NotSingleTargetSpell = true
BuffTextureName = "LuxCrashingBlitz2.dds"
BuffName = "LuxLightBindingMis"
AutoBuffActivateEffect = "LuxLightBinding_tar.troy"
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
SelfExecuteBuildingBlocks = {}
TargetExecuteBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      SrcValueByLevel = {
        60,
        110,
        160,
        210,
        260
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "StunLength", SrcValue = 2}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "HalfDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StunLength",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "HalfSnare",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FirstTargetHit",
      Src1VarTable = "CharVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsStealthed",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageAmount",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.7,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Net,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "StunLength",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "FirstTargetHit",
              DestVarTable = "CharVars",
              SrcValue = true
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "LuxIlluminatingFraulein",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 6,
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
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageAmount",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.7,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Net,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "StunLength",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "FirstTargetHit",
                  DestVarTable = "CharVars",
                  SrcValue = true
                }
              },
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "LuxIlluminatingFraulein",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 6,
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
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "DamageAmount",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.7,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Net,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "StunLength",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "FirstTargetHit",
                      DestVarTable = "CharVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "LuxIlluminatingFraulein",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 6,
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
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsStealthed",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "HalfDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.35,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "LuxLightBinding",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Net,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "HalfSnare",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Owner",
                  BuffName = "LuxIlluminatingFraulein",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 6,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              }
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
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
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "HalfDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.35,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "LuxLightBinding",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Net,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "HalfSnare",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              },
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "LuxIlluminatingFraulein",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 6,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
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
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "HalfDamage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.35,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "LuxLightBinding",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Net,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 0,
                      BuffVarsTable = "NextBuffVars",
                      DurationVar = "HalfSnare",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                    SubBlocks = {
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Owner",
                          BuffName = "LuxIlluminatingFraulein",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 6,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false
                        }
                      }
                    }
                  },
                  {
                    Function = BBDestroyMissile,
                    Params = {
                      MissileIDVar = "MissileNetworkID"
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
      Name = "luxilluminatingfraulein"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "luxlightbinding"
    }
  }
}
