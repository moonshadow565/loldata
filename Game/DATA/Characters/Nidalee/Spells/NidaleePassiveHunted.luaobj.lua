BuffTextureName = "Nidalee_Passive.dds"
BuffName = "NidaleePassiveHunted"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_q_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nidaleepassivehunting"
    }
  }
}
