BuffTextureName = "GragasBodySlam.dds"
BuffName = "GragasBodySlamTargetSlow"
AutoBuffActivateEffect = "Global_Slow.troy"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
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
      TargetVar = "Attacker",
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
