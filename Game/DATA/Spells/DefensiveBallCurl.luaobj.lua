NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armordillo_ShellBash.dds"
BuffName = "DefensiveBallCurl"
SpellToggleSlot = 2
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "rammusdbc"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "defensiveballcurl_buf.troy"
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
