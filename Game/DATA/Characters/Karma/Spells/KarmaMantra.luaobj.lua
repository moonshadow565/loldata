BuffTextureName = "Karma_R.dds"
BuffName = "KarmaMantra"
SpellToggleSlot = 4
SpellVOOverrideSkins = {
  "KarmaClassic"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmamantra"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_r_activate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_r_activate_overhead.troy"
    }
  }
}
