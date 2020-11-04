NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "3188_Blackfire_Torch.dds"
BuffName = "BlackfireTorchBurn"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tt_blackfiretorch.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "barondebuff"
    }
  }
}
