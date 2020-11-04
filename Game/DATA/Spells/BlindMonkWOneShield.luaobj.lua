NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "BlindMonkWOne.dds"
BuffName = "BlindMonkSafeguard"
AutoBuffActivateEffect = "blindMonk_W_shield_self.troy"
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_w_shield_self_deactivate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_w_shield_block.troy"
    }
  }
}
