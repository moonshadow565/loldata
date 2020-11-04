DoesntBreakShields = true
BuffTextureName = "Sejuani_Permafrost.dds"
BuffName = "SejuaniFrostArctic"
AutoBuffActivateEffect = "Sejuani_Frost_Arctic.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_frost_arctic_overhead.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuanifrostchaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_wintersclaw_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_wintersclaw_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_wintersclaw_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniwintersclaw"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniwintersclawchaos"
    }
  }
}
