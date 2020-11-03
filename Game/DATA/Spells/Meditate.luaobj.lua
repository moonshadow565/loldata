NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 5
BuffTextureName = "MasterYi_Vanish.dds"
BuffName = "Meditate"
AutoCooldownByLevel = {
  50,
  50,
  50,
  50,
  50
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  }
}
