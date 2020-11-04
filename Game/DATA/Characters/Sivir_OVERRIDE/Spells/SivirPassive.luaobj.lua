BuffTextureName = "Sivir_Passive.dds"
BuffName = "SivirPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirpassivespeed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirrpassive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirrpassivemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirrpassivebuff"
    }
  }
}
