BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Marker"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShurikenDamage",
      DestVarTable = "InstanceVars",
      SrcValue = 15
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ShurikenDamage",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LastHit",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "ShenWayOfTheNinjaAura"
        },
        SubBlocks = {
          {
            Function = BBGetGameTime,
            Params = {SecondsVar = "CurTime"}
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "CurTime",
              Src2Var = "LastHit",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TimeSinceLastHit",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TimeSinceLastHit",
              Value2 = 10,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "ShenWayOfTheNinjaAura",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
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
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Miss,
      CompareOp = CO_NOT_EQUAL
    },
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
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "ShenWayOfTheNinjaAura"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      PosVar = "Owner",
                      EffectName = "Globalhit_red.troy",
                      Flags = 0,
                      EffectIDVar = "hi",
                      TargetObjectVar = "Owner",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_NEUTRAL,
                      FOWVisibilityRadius = 900,
                      SendIfOnScreenOrDiscard = true
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "ShenWayOfTheNinjaAura"
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "MaxHP",
                  OwnerVar = "Owner",
                  Function = GetMaxHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MaxHP",
                  Src1Value = 0,
                  Src2Value = 0.04,
                  DestVar = "BonusDmgFromHP",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BonusDmgFromHP",
                  Src2Var = "ShurikenDamage",
                  Src2VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageToDeal",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBGetGameTime,
                Params = {
                  SecondsVar = "LastHit",
                  SecondsVarTable = "InstanceVars"
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
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
            Function = BBIf,
            Params = {
              Src1Var = "HitResult",
              Value2 = HIT_Dodge,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "LastHit",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 3,
                  DestVar = "LastHit",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBGetGameTime,
                Params = {SecondsVar = "CurTime"}
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CurTime",
                  Src2Var = "LastHit",
                  Src2VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "TimeSinceLastHit",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TimeSinceLastHit",
                  Value2 = 10,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "ShenWayOfTheNinjaAura",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      BuffType = BUFF_Aura,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
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
  }
}
BuffOnLevelUpBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CurrentDamage",
      SrcValueByLevel = {
        15,
        20,
        25,
        30,
        35,
        40,
        45,
        50,
        55,
        60,
        65,
        70,
        75,
        80,
        85,
        90,
        95,
        100,
        105,
        110
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentDamage",
      Src2Var = "ShurikenDamage",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ShurikenDamage",
          DestVarTable = "InstanceVars",
          SrcVar = "CurrentDamage"
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "ShurikenDamage",
          ValueVarTable = "InstanceVars",
          Index = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenwayoftheninjaaura"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_red.troy"
    }
  }
}
