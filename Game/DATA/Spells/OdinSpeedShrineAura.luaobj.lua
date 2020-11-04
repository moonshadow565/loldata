BuffName = "OdinShamanAura"
PersistsThroughDeath = true
Nondispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odin_shrine_time.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinspeedshrinebuff"
    }
  }
}
