BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "Iceblast Slow"
AutoBuffActivateEffect = "Global_Freeze.troy"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = 300
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = -300
    }
  }
}
