BuffTextureName = "2038_Potion_of_Elusiveness.dds"
BuffName = "OdinVampRelic"
AutoBuffActivateEffect = "PotionofElusiveness_itm.troy"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "regen_rune_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  }
}
