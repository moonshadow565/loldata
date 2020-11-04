OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackCounter",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PickACard"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PinkCard"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "BlueCard"
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "RedCard"
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "AttackCounter",
                      Src1VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "AttackCounter",
                      DestVarTable = "InstanceVars",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBDebugSay,
                    Params = {
                      OwnerVar = "Owner",
                      ToSay = "YO!",
                      SrcVar = "AttackCounter",
                      SrcVarTable = "InstanceVars"
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "AttackCounter",
                      Src1VarTable = "InstanceVars",
                      Value2 = 3,
                      CompareOp = CO_GREATER_THAN
                    },
                    SubBlocks = {
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "Counter",
                          DestVarTable = "NextBuffVars",
                          SrcValue = 0
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "WillRemove",
                          DestVarTable = "NextBuffVars",
                          SrcValue = false
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Owner",
                          AttackerVar = "Owner",
                          BuffName = "PickACard",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 25000,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "AttackCounter",
                          DestVarTable = "InstanceVars",
                          SrcValue = 0
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
    Params = {Name = "pickacard"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pinkcard"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "bluecard"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "redcard"}
  }
}
