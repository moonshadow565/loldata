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
      Name = "sona_base_w_tar_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapassivedebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonawpcdeathrecapfix"
    }
  }
}
