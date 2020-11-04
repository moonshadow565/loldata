NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "RelicYellowWard.dds"
BuffName = "RelicYellowWard"
AutoBuffActivateEffect = "Ward_Wriggles_Idle.troy"
AutoBuffActivateEffect2 = "Global_Trinket_Yellow.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_trinket_yellow_death.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sightwardstealth"
    }
  }
}
