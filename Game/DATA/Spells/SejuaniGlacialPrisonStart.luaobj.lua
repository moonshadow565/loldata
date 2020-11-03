NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Sejuani_GlacialPrison.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PersistsThroughDeath = true
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_glacialprisondetonate_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_ult_impact_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_ult_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniglacialprisondetonate"
    }
  }
}
