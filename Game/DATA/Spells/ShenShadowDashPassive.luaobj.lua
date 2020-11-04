PersistsThroughDeath = true
NonDispellable = true
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Attacker"}
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Attacker",
          CasterVar = "Attacker",
          BuffName = "ShenShadowDashCooldown"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "ShenShadowDashCooldown",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CD",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Attacker",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CD",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CD",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "NewCD",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetSlotSpellCooldownTimeVer2,
                Params = {
                  Src = 0,
                  SrcVar = "NewCD",
                  SlotNumber = 0,
                  SlotType = SpellSlots,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  OwnerVar = "Attacker"
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
      Name = "shenshadowdashcooldown"
    }
  }
}
