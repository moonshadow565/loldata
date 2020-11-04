BuffTextureName = "Corki_MissileBarrage.dds"
BuffName = "MissileBarrageCheck"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missilebarrage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "mbcheck2"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "corkimissilebarragenc"
    }
  }
}
