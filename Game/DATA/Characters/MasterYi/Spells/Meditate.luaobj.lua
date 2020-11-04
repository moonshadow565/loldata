NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 4
BuffTextureName = "MasterYi_W.dds"
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
      Name = "masteryi_base_w_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_w_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "meditatedefense"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "masteryi_base_w_dmg.troy"
    }
  }
}
