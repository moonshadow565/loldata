BuffTextureName = "UrgotCorrosiveCharge.dds"
BuffName = "UrgotCorrosiveDebuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "twitch_venom_splash_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twitchvenomcaskdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deadlyvenom"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deadlyvenom_internal"
    }
  }
}
