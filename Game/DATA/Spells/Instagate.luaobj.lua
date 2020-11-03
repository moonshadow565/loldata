NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
ChannelDuration = 4
BuffTextureName = "Cardmaster_Premonition.dds"
BuffName = "Gate"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  100,
  85,
  70,
  55,
  40
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "gatefix"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterteleport_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gatemarker_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gatemarker_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterteleport_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterteleportarrive.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "gate"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "instagate"}
  }
}
