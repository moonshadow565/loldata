DoesntBreakShields = true
BuffTextureName = "Sejuani_E_Bright.dds"
BuffName = "SejuaniFrostArctic"
AutoBuffActivateEffect = "Global_Freeze.troy"
PopupMessage1 = "game_floatingtext_Slowed"
SpellVOOverrideSkins = {
  "SejuaniClassic"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_e_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_e_cas_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaniwintersclaw"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_e_tar.troy"
    }
  }
}
