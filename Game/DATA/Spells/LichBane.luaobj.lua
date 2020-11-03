BuffTextureName = "126_Zeal_and_Sheen.dds"
BuffName = "LichBane"
AutoBuffActivateEffect = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bluehands_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AbilityPower",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Sheen"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Sheen"
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
                  Src1Var = "AbilityPower",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 3,
                  DestVar = "AbilityPower",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "AbilityPower",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_ADD
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
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.25,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              }
            }
          },
          {
            Function = BBSpellBuffClear,
            Params = {TargetVar = "Owner", BuffName = "LichBane"}
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
    Params = {Name = "sheen"}
  },
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
    Params = {Name = "lichbane"}
  }
}
