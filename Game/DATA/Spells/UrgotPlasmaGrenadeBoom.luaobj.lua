BuffTextureName = "UrgotCorrosiveCharge.dds"
BuffName = "UrgotCorrosiveDebuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotplasmagrenade_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotcorrosivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotplasmagrenade_hit.troy"
    }
  }
}
