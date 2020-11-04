BuffTextureName = "Tristana_ExplosiveShot.dds"
BuffName = "Detonating Shot"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "RocketTristana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "detonatingshot_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tristana_explosiveshot_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "detonatingshot_target"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosiveshotdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
