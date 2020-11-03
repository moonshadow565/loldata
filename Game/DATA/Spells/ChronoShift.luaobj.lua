BuffTextureName = "Chronokeeper_Timetwister.dds"
BuffName = "Chrono Shift"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  160,
  140,
  120
}
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 4
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nickoftime_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "chronorevive"
    }
  }
}
