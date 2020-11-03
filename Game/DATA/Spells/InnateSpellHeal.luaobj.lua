NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 13
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
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "meditate"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "innatespellheal"
    }
  }
}
