BuffTextureName = "3057_Sheen.dds"
BuffName = "Sheen"
AutoBuffActivateEffect = "enrage_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "enrage_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BaseDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "IsSheen",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
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
            Function = BBIf,
            Params = {
              Src1Var = "IsSheen",
              Src1VarTable = "InstanceVars",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrTigerStance"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 4.5,
                      DestVar = "PercentBase",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "PercentBase",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 1.5,
                      DestVar = "PercentBase",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "PercentBase",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
                    }
                  }
                }
              },
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Owner",
                  BuffName = "SheenDelay"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "SheenDelay",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1.3,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {TargetVar = "Owner", BuffName = "Sheen"}
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "IsSheen",
              Src1VarTable = "InstanceVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "UdyrTigerStance"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 3,
                      DestVar = "PercentBase",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "PercentBase",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BaseDamage",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "PercentBase",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "PercentBase",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
                    }
                  }
                }
              },
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  CasterVar = "Owner",
                  BuffName = "SheenDelay"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "SheenDelay",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1.2,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {TargetVar = "Owner", BuffName = "Sheen"}
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
              }
            }
          }
        }
      }
    }
  }
}
CharOnLaunchAttackBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "SheenDelay"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SheenDelay",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.4,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheendelay"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sheen"}
  }
}
