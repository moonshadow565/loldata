BuffTextureName = "NamiQ.dds"
BuffName = "NamiQtt"
AutoBuffActivateEffect = "Nami_Q_debuff.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
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
      Name = "nami_q_pop.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namibubblemarker"
    }
  }
}
