NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Galio_Bulwark.dds"
BuffName = "GalioBulwark"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_target_shield_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_target_shield_01_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galiobulwarkheal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_shield_activate_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_bullwark_shield_activate.troy"
    }
  }
}
