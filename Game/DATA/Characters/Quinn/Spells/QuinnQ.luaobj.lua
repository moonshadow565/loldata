NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Quinn_Q.dds"
BuffName = "Blind"
PopupMessage1 = "game_floatingtext_Blinded"
SpellFXOverrideSkins = {
  "CyberEzreal",
  "PhoenixQuinn"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "quinnsuppressq"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_miss.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_miss_minion.troy"
    }
  }
}
