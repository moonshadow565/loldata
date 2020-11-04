BuffTextureName = "Commander_Passive.dds"
BuffName = "TalentReaper"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talentreapervfx"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talentreaperdisplay"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mastery_reaper_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mastery_reaper_1c.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mastery_reaper_2c.troy"
    }
  }
}
