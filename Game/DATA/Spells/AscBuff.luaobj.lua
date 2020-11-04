BuffTextureName = "Tenacity.dds"
BuffName = "AscBuff"
OnPreDamagePriority = 5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascrevivespecialcase"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascbufftransfer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ascforcebubble.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "moveaway"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascbufficon"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_asc_aura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_asc_avatar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ascbuffspecialregen"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelynn_redeye.troy"
    }
  }
}
