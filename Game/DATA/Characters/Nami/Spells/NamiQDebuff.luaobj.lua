BuffTextureName = "NamiQ.dds"
BuffName = "NamiQtt"
AutoBuffActivateEffect2 = "LOC_Stun.troy"
AutoBuffActivateAttachBoneName2 = "C_BUFFBONE_GLB_CENTER_LOC"
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {"NamiKoi"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalisairborne"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_Q_pop.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_base_q_debuff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_base_q_pop.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namibubblemarker"
    }
  }
}
