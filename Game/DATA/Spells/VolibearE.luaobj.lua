NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "VolibearE.dds"
BuffName = "VolibearE"
AutoBuffActivateEffect = "GLOBAL_SLOW.TROY"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PopupMessage1 = "game_floatingtext_Slowed"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_e_aoe_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_e_aoe_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_e_cas_blast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_e_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_e_tar.troy"
    }
  }
}
