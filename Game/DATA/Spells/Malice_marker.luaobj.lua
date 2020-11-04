AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Unit",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Unit",
              BuffName = "SilentKiller"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "MaliceandSpiteCanCast",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 180,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "AmountToHeal",
                  SrcValueByLevel = {
                    0.25,
                    0.25,
                    0.25
                  }
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "Temp1",
                  OwnerVar = "Owner",
                  Function = GetMaxHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AmountToHeal",
                  Src2Var = "Temp1",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HealthToRestore",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Unit",
                  Delta = 0,
                  DeltaVar = "HealthToRestore",
                  HealerVar = "Unit"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "evelyn_heal_trigger.troy",
                  Flags = 0,
                  EffectIDVar = "b",
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
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
      Name = "silentkiller"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maliceandspitecancast"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelyn_heal_trigger.troy"
    }
  }
}
