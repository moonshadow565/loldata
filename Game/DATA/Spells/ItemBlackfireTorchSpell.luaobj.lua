NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3188_Blackfire_Torch.dds"
BuffName = "ItemBlackfireTorchSpell"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemblackfiretorchspell"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "obj_deathfiregrasp_debuff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tt_blackfiretorch.troy"
    }
  }
}
