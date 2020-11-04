BuffTextureName = "GSB_taunt.dds"
BuffName = "Taunt"
AutoBuffActivateEffect = "LOC_Taunt.troy"
AutoBuffActivateAttachBoneName = "head"
PopupMessage1 = "game_floatingtext_Taunted"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_taunt_unit_indicator.troy"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "global_taunt.troy"
    }
  }
}
