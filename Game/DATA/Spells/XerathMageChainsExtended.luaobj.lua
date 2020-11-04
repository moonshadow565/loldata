NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Xerath_MageChains.dds"
BuffName = "XerathMRShred"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "IronForgeXerath"
}
PreLoadBuildingBlocks = {
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
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_bolt_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathmagechains"
    }
  }
}
