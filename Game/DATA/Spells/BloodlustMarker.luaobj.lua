BuffTextureName = "DarkChampion_Bloodlust.dds"
BuffName = "Blood Lust"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
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
      DestVar = "DamageMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        4,
        4,
        4,
        4,
        4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CritDamageMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.015,
        0.0225,
        0.03,
        0.0375,
        0.045
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "BloodlustParticle",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 15,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Bloodlust"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Bloodlust",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 8,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Bloodlust",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 8,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Bloodlust",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 8,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
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
      Value2 = HIT_Critical,
      CompareOp = CO_EQUAL
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
          DestVar = "DamageMod",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            4,
            4,
            4,
            4,
            4
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CritDamageMod",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            0.015,
            0.0225,
            0.03,
            0.0375,
            0.045
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "BloodlustParticle",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Bloodlust"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Bloodlust",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 8,
              NumberStacks = 1,
              Duration = 15,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Bloodlust",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 8,
              NumberStacks = 1,
              Duration = 15,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Bloodlust",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 8,
              NumberStacks = 1,
              Duration = 15,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      Name = "bloodlustparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "bloodlust"}
  }
}
