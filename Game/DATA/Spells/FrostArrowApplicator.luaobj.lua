NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "FrostArrow"
AutoBuffActivateEffect = "Global_Freeze.troy"
TriggersSpellCasts = false
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
                      SpellSlotValue = 0,
                      SpellbookType = SPELLBOOK_CHAMPION,
                      SlotType = SpellSlots,
                      OwnerVar = "Owner",
                      Function = GetSlotSpellLevel
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MovementSpeedMod",
                      DestVarTable = "NextBuffVars",
                      SrcValueByLevel = {
                        -0.15,
                        -0.2,
                        -0.25,
                        -0.3,
                        -0.35
                      }
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "FrostArrow",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Slow,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 2,
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
    Params = {Name = "frostarrow"}
  }
}
