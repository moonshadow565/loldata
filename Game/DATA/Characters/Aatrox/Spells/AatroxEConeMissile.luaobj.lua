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
  "FrostShyvana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_E_Slow.troy"
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
