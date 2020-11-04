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
      Name = "sejuanifrostchaos"
    }
  }
}
