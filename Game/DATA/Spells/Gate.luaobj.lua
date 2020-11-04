NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Cardmaster_Premonition.dds"
BuffName = "Gate"
AutoCooldownByLevel = {
  100,
  85,
  70,
  55,
  40
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterteleport_green.troy"
    }
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
      Name = "gatemarker_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gatemarker_red.troy"
    }
  }
}
