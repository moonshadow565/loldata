BuffTextureName = "YorickOmenOfDeath.dds"
BuffName = "YorickOmenPreDeath"
AutoBuffActivateEffect = "yorick_ult_revive_tar.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_01_teamid_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_01_teamid_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefied"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurpriseready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickultpetactive"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelaylich"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelaykogmaw"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelay"
    }
  }
}
