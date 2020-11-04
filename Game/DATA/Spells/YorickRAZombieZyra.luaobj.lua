BuffTextureName = "YorickOmenOfDeath.dds"
BuffName = "YorickOmenReanimated"
AutoBuffActivateEffect2 = "yorick_ult_04.troy"
AutoBuffActivateEffect3 = "yorick_ult_revive_tar.troy"
AutoBuffActivateEffect4 = "yorick_ult_05.troy"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_03_teamid_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yorick_ult_03_teamid_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthorns"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornsspawn"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornscd"
    }
  }
}
