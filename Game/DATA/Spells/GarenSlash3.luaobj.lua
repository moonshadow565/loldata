NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_DecisiveStrike.dds"
BuffName = "GarenSlash"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_descisivestrike_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_descisivestrike_indicator_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenfastmove"
    }
  }
}
