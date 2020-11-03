NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = "caitlyn_entrapment_slow.troy"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_entrapment_tar.troy"
    }
  }
}
