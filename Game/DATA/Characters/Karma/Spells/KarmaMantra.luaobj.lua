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
      Name = "tempkarma_mantraactivate_aura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_mantraactivate_stones.troy"
    }
  }
}
