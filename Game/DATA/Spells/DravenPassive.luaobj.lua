BuffTextureName = "Draven_passive.dds"
BuffName = "DravenPassive"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_recall_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_recall_sound_reaper.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenrecalloverride"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenspinningattack2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenspinningattack2crit"
    }
  }
}
