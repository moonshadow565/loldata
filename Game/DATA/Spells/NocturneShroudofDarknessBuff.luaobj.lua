NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_ShroudofDarkness.dds"
BuffName = "NocturneShroudofDarkness"
AutoBuffActivateEffect = "nocturne_shroud_AttackSpeed_buff.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "nocturne_shroud_AttackSpeed_buff.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedBoost",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
