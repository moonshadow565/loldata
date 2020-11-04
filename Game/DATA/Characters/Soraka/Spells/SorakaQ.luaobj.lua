BuffTextureName = "Soraka_Q.dds"
BuffName = "SorakaQ"
AutoBuffActivateEffect = "Global_Slow.troy"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SorakaSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_base_q_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_base_q_indicator_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
