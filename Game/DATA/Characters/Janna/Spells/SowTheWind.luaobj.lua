NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Janna_Zephyr.dds"
BuffName = "Zephyr"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "JannaForecast"
}
SpellVOOverrideSkins = {
  "JannaForecast"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sowthewind_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sowthewind_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  }
}
