NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DrMundo_Masochism.dds"
BuffName = "VolibearWBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PersistsThroughDeath = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwstats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdebuffchaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibearw_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdrain"
    }
  }
}
