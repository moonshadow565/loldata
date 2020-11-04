NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Bowmaster_IceArrow.dds"
BuffName = "Frost Shot"
SpellToggleSlot = 1
TriggersSpellCasts = false
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCostPerAttack",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 1,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner"}
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "Temp",
      OwnerVar = "Owner",
      Function = GetMana
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Temp",
              Src2Var = "ManaCostPerAttack",
              Src2VarTable = "InstanceVars",
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "ManaCostPerAttack",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = -1,
                  DestVar = "ManaToInc",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIncMana,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "ManaToInc"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FrostShot"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FrostShot"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCostPerAttack",
          DestVarTable = "NextBuffVars",
          SrcValue = 8
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostshot"}
  }
}
