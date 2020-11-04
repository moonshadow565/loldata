NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Hecarim_Rampage.dds"
BuffName = "HecarimRapidSlash"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "RocketTristana"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_q.troy "
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarimtempslashsound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrapidslash2"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_q_audioimpact.troy"
    }
  }
}
