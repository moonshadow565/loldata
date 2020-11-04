NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_Purgatory.dds"
BuffName = "Soul Shackles"
AutoBuffActivateEffect = "SoulShackle_buf.troy"
AutoBuffActivateEffect2 = "SoulShackle_tar.troy"
AutoCooldownByLevel = {
  80,
  80,
  80
}
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soulshackle_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshacklesowner"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "soulshackles"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
