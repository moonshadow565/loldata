BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
BuffOnHitUnitBuildingBlocks = {
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
                    Function = BBGetSlotSpellInfo,
                    Params = {
                      DestVar = "Level",
                      SpellSlotValue = 2,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      SlotType = SpellSlots,
                      OwnerVar = "Owner",
                      Function = GetSlotSpellLevel
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "DamagePerTick",
                      DestVarTable = "NextBuffVars",
                      SrcValueByLevel = {
                        6,
                        12,
                        18,
                        24,
                        30
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "ToxicShotParticle",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Poison,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5.1,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "toxicshotparticle"
    }
  }
}
