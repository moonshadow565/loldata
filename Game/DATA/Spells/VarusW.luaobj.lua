NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "VarusW.dds"
BuffName = "VarusW"
SpellToggleSlot = 2
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "VarusAscended"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusw_counter_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusw_counter_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusw_counter_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdebuff"
    }
  }
}
