NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
PopupMessage1 = "game_floatingtext_Snared"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namipassivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Skin01_R_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_R_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namirwaveslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namirwavestun"
    }
  }
}
