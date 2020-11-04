NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Armsmaster_Disarm.dds"
BuffName = "CounterStrike"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "counterstrike_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "counterstrikecancast"
    }
  }
}
