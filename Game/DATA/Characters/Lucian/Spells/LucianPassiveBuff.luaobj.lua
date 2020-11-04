IsDamagingSpell = false
BuffTextureName = "Lucian_Passive.dds"
BuffName = "LucianPassiveBuff"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_p_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lucian_p_sound_only.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemhurricaneattack"
    }
  }
}
