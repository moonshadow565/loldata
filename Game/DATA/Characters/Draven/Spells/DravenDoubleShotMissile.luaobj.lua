NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Timestop.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
SpellFXOverrideSkins = {
  "Draven_Gladiator",
  "DravenSkin03"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravendoubleshotmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravendoubleshot"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_base_e_tar.troy"
    }
  }
}
