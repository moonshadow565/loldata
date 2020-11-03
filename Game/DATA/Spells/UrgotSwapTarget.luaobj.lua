NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "UrgotPositionReverser.dds"
BuffName = "UrgotSwapTarget"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoCooldownByLevel = {
  100,
  85,
  70,
  55,
  40
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgot_battlecast_swap_beam.troy"
    }
  }
}
