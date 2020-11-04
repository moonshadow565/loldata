NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Evelynn_Drink.dds"
BuffName = "Malice And Spite"
AutoBuffActivateEffect = "evelyn_maliceSpite_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "evelyn_maliceSpite_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateEffect3 = "evelyn_maliceSpite_speed_buf.troy"
AutoBuffActivateAttachBoneName3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CDBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageReduction",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      DeltaVar = "CDBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageReduction",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.15,
        0.25,
        0.35
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CDBonus",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.2,
        -0.3,
        -0.4
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "MaliceandSpite",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 15,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maliceandspite"
    }
  }
}
