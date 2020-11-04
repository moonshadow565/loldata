NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_E1.dds"
BuffName = "GarenE"
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "garene"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_e_cancel.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_e_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "masterattackspeedbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenecancel"
    }
  }
}
