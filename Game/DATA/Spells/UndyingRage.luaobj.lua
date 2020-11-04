NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DarkChampion_EndlessRage.dds"
BuffName = "Undying Rage"
AutoBuffActivateEffect = "UndyingRage_buf.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = "UndyingRage_glow.troy"
AutoBuffActivateAttachBoneName2 = "L_calf"
AutoBuffActivateEffect3 = "UndyingRage_glow.troy"
AutoBuffActivateAttachBoneName3 = "R_calf"
AutoBuffActivateEffect4 = "UndyingRageSpine_glow.troy"
AutoBuffActivateAttachBoneName4 = "spine"
AutoCooldownByLevel = {
  140,
  120,
  100
}
NonDispellable = true
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth
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
        Function = BBMath,
        Params = {
          Src1Var = "CurHealth",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_UndyingRage"
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NumBloodlusts",
      SrcValueByLevel = {
        3,
        6,
        9
      }
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
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Level", SrcValue = 1}
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CriticalDamageMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.04,
        0.06,
        0.08,
        0.1,
        0.12
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "moveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.02,
        0.03,
        0.04,
        0.05,
        0.06
      }
    }
  },
  {
    Function = BBWhile,
    Params = {
      Src1Var = "NumBloodlusts",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
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
          MaxStack = 9,
          NumberStacks = 1,
          Duration = 15,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "NumBloodlusts",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "NumBloodlusts",
          MathOp = MO_SUBTRACT
        }
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "bloodlust"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodlustparticle"
    }
  }
}
