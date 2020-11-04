IsDeathRecapSource = true
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_e_tar_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaepcdeathrecapfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapassiveslow"
    }
  }
}
