NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Xerath_MageChains.dds"
BuffName = "XerathBolt"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "IronForgeXerath"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_darkiron_magechains_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_magechains_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathmagechainsroot"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_darkiron_chains_hit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_bolt_hit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathmagechains"
    }
  }
}
