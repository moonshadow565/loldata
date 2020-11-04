BuffTextureName = "KarmaMantra.dds"
BuffName = "KarmaMantraCharge"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmachakracharge"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaonemantraparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmatwomantraparticle"
    }
  }
}
