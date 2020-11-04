NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "SadMummy_BandAidThingy.dds"
BuffName = "CurseoftheSadMummy"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "BadrobotAmumu"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "amumu_sadrobot_ultwrap.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursebandages.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursebandages_cas1.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotamumur"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "disarm"}
  }
}
