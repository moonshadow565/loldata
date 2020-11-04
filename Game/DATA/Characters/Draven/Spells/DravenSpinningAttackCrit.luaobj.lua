BuffTextureName = "3071_The_Black_Cleaver.dds"
BuffName = "DravenSpinning"
SpellFXOverrideSkins = {
  "DravenSkin03"
}
SpellVOOverrideSkins = {
  "Draven_SoulReaper",
  "DravenSkin03"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenspinningreturntracker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_base_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "dravendot"}
  }
}
