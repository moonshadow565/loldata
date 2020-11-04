BuffTextureName = "SadMummy_AuraofDespair.dds"
BuffName = "AuraofDespair"
AutoBuffActivateEffect = "Despair_buf.troy"
AutoBuffActivateAttachBoneName = "head"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "auraofdespairdrainlife"
    }
  }
}
