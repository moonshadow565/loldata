BuffTextureName = "Cryophoenix_Rebirth.dds"
BuffName = "RebirthReady"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RebirthArmorMod",
      SrcValueByLevel = {
        -40,
        -40,
        -40,
        -40,
        -25,
        -25,
        -25,
        -10,
        -10,
        -10,
        -10,
        5,
        5,
        5,
        20,
        20,
        20,
        20
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "RebirthArmorMod",
      Index = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurHealth",
      Src2Var = "DamageAmount",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WillRevive"
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageAmount",
              SrcValue = 0
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Owner",
              CasterVar = "Owner",
              BuffName = "Rebirth"
            },
            SubBlocks = {
              {
                Function = BBGetLevel,
                Params = {TargetVar = "Owner", DestVar = "Level"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "RebirthArmorMod",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    -40,
                    -40,
                    -40,
                    -40,
                    -25,
                    -25,
                    -25,
                    -10,
                    -10,
                    -10,
                    -10,
                    5,
                    5,
                    5,
                    20,
                    20,
                    20,
                    20
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Rebirth",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 6,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "WillRemove",
              DestVarTable = "InstanceVars",
              SrcValue = true
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
      DestVar = "RebirthArmorMod",
      SrcValueByLevel = {
        -40,
        -40,
        -40,
        -40,
        -25,
        -25,
        -25,
        -10,
        -10,
        -10,
        -10,
        5,
        5,
        5,
        20,
        20,
        20,
        20
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "RebirthArmorMod",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "willrevive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rebirth"}
  }
}
