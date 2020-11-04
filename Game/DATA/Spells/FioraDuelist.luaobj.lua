BuffTextureName = "Fiora_Duelist.dds"
BuffName = "FioraDuelist"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraduelisthot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraduelisthotparticle2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fioraduelisthotparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "fiorarun"}
  }
}
