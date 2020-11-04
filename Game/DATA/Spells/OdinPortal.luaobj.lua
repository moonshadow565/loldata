BuffTextureName = ""
BuffName = "OdinShrineAura"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalmovecheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalchannel"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalteleport"
    }
  }
}
