BuffTextureName = "Nocturne_UmbraBlades.dds"
BuffName = "NocturneUmbraBlades"
AutoBuffActivateEffect = "NocturnePassiveReady.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_L_PALM"
AutoBuffActivateEffect2 = "NocturnePassiveReady.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_R_PALM"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturnepassivecooldownmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturnepassivecooldown"
    }
  }
}
