BuffTextureName = "Nidalee_Passive.dds"
BuffName = "NidaleePassiveHunting"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_p_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pounceenabler"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_cougar_w_buf_circle.troy"
    }
  }
}
