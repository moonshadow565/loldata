IsDeathRecapSource = true
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_q_powerchord_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_q_tar_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaqpcdeathrecapfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
