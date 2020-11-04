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
      DestVar = "CriticalChanceMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.04
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.08
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MaxStacks",
      SrcValue = 0,
      SrcValueByLevel = {
        2,
        4,
        6,
        8,
        10
      }
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
      MaxStack = 0,
      MaxStackVar = "MaxStacks",
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
