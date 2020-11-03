NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Kassadin_ForcePulse.dds"
BuffName = "ForcePulse"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "forcepulsecancast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "forcepulsecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
