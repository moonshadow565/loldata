NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_Q.dds"
BuffName = "GarenQBuff"
SpellFXOverrideSkins = {
  "SteellegionGaren"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_q_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_base_q_cas_sword.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_steel_q_electric_sword.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globalruncyclemanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenqhaste"
    }
  }
}
