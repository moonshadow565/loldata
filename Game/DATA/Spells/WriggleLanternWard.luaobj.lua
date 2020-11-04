NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Icon_Item_Wriggle'sLantern_01.dds"
BuffName = "WriggleLanternWard"
AutoBuffActivateEffect = "Ward_Wriggles_Idle.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sightwardstealth"
    }
  }
}
