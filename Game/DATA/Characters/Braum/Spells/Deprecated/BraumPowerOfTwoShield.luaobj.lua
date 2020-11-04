NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Braum_ThatsMyCarry.dds"
BuffName = "BraumPowerOfTwoShield"
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nikodelayheal_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "blindmonk_w_shield_block.troy"
    }
  }
}
