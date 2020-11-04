BuffTextureName = "Nautilus_AnchorChain.dds"
BuffName = "NautilusAnchorDragRoot"
AutoBuffActivateEffect = ""
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nautilusqimpact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nautilusminorknockaway"
    }
  }
}
