BuffTextureName = "Shen_KiStrike.dds"
BuffName = "Shen Passive Marker"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShurikenDamage",
      DestVarTable = "InstanceVars",
      SrcValue = 10
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
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShurikenDamage",
      SrcValueByLevel = {
        10,
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
        105
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatHPPoolMod,
      TargetVar = "Owner",
      DestVar = "MaxHP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHP",
      Src1Value = 0,
      Src2Value = 0.08,
      DestVar = "BonusDmgFromHP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDmgFromHP",
      Src2Var = "ShurikenDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "FinalDamage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ShurikenDamage",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "FinalDamage",
      Index = 2
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusDmgFromHP",
      Index = 3
    }
  },
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
              Value2 = 8,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "ShenWayOfTheNinjaAura",
                      BuffAddType = BUFF_RENEW_EXISTING,
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
                  Src2Value = 2,
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
                  Value2 = 8,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "ShenWayOfTheNinjaAura",
                          BuffAddType = BUFF_RENEW_EXISTING,
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
      Name = "shenwayoftheninjaaura"
    }
  }
}
