NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_Purgatory.dds"
BuffName = "Soul Shackles"
AutoCooldownByLevel = {
  80,
  80,
  80
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elise_human_w_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "elise_human_w_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "elisehumanwdamage"
    }
  }
}
