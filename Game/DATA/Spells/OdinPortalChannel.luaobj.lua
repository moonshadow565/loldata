BuffTextureName = ""
BuffName = "OdinShrineAura"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "teleporthome.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinportalteleport"
    }
  }
}
