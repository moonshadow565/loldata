NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {""}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_pulsefire_mysticshot_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ezrealrisingspellforce"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_mysticshot_tar.troy"
    }
  }
}
