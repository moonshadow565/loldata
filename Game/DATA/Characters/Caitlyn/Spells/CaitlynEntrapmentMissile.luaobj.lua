NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
AutoBuffActivateEffect = "caitlyn_Base_entrapment_slow.troy"
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
  }
}
