NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "RengarEReg.dds"
BuffName = "RengarERoot"
AutoCooldownByLevel = {
  12,
  11,
  10,
  9,
  8
}
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "HunterRengar"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarefinalmax"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengareslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_base_e_max_tar.troy"
    }
  }
}
