NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armordillo_ShellBash.dds"
BuffName = "DefensiveBallCurl"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "rammusdbc"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "defensiveballcurlcancel"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dbc_out.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "defensiveballcurl"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thornmail_tar.troy"
    }
  }
}
