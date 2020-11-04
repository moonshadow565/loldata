BuffTextureName = "GragasBodySlam.dds"
BuffName = "GragasBodySlamTargetSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateEffect2 = "gragas_bodySlam_unit_tar.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = "gragas_bodySlam_unit_tar_02.troy"
AutoBuffActivateAttachBoneName3 = "chest"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SlowAmount",
      DestVarTable = "InstanceVars",
      SrcValue = -0.35
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SlowAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
