BuffTextureName = "NamiQ.dds"
BuffName = "NamiQtt"
AutoBuffActivateEffect = "Nami_Q_debuff.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
AutoBuffActivateEffect2 = "global_stun.troy"
AutoBuffActivateAttachBoneName2 = "C_Buffbone_Glb_Head_Loc"
PopupMessage1 = "game_floatingtext_Stunned"
SpellFXOverrideSkins = {"NamiKoi"}
PreLoadBuildingBlocks = {
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
