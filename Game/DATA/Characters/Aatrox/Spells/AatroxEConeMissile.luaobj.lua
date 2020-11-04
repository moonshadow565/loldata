NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Aatrox_E.dds"
BuffName = "AatroxEConeMissile"
AutoBuffActivateEffect = "global_slow.troy"
IsDeathRecapSource = true
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {
  "FrostShyvana",
  "AatroxSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_base_e_slow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxeconemissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxeconemissile2"
    }
  }
}
