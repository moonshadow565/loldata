NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "CaitlynSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_entrapment_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_base_entrapment_slow.troy"
    }
  }
}
