NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "WriggleLanternWard"
AutoBuffActivateEffect = "Ward_Wriggles_Idle.troy"
MinimapIconTextureName = "Minimap_Ward_Green.tga"
MinimapIconEnemyTextureName = "Minimap_Ward_Green_Enemy.tga"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sightwardstealth"
    }
  }
}
