BuffTextureName = "Jayce_AccelerationGate.dds"
BuffName = "JayceAccelerationGate"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_wall_accel_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
