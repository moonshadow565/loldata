BuffTextureName = "AkaliTwilightShroud.dds"
BuffName = "AkaliTwilightShroud"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_twilight_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akaliholdstealth"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "recall"}
  }
}
