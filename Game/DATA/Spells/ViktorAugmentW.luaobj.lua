OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "ViktorGravitonFieldAugment",
      TargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {}
BuffOnLevelUpBuildingBlocks = {}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorgravitonfieldaugment"
    }
  }
}
