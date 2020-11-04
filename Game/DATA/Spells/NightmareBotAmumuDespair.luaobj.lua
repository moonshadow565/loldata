BuffTextureName = "SadMummy_AuraofDespair.dds"
BuffName = "AuraofDespair"
AutoBuffActivateEffect = "Despair_buf.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
AutoBuffActivateEffect2 = "Despairpool_tar.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotamumudespairdamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "despair_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "despairpool_tar.troy"
    }
  }
}
