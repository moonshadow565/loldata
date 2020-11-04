BuffTextureName = ""
BuffName = "OdinShamanAura"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_shrine_aura.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinshrinebuff"
    }
  }
}
