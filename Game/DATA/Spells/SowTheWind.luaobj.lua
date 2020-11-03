NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Janna_Zephyr.dds"
BuffName = "Zephyr"
AutoBuffActivateAttachBoneName = "head"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sowthewind_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sowthewind_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
