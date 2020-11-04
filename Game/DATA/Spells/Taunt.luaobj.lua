BuffTextureName = "GSB_taunt.dds"
BuffName = "Taunt"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PopupMessage1 = "game_floatingtext_Taunted"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurandmarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_taunt_unit_indicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shenshadowdashcooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_taunt_multi_unit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_shadowdash_unit_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "puncturingtauntarmordebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_taunt.troy"
    }
  }
}
