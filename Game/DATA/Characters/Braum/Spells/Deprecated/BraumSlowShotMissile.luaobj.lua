NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = "DarkBinding_tar.troy"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_mysticshot_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_net_tar.troy"
    }
  }
}
