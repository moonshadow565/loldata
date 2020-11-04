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
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongpcdeathrecapfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapowerchorddebuffslow"
    }
  }
}
