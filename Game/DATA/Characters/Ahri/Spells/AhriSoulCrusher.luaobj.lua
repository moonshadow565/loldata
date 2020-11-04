BuffTextureName = "Ahri_SoulEater.dds"
BuffName = "AhriSoulCrusher"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahriidleparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ahripassiveparticle"
    }
  }
}
