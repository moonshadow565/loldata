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
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        0.2,
        0.25,
        0.3
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        0.5,
        0.75,
        1
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
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
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell4",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = false,
      Lock = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "EvelynnUnlockAnimation",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
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
