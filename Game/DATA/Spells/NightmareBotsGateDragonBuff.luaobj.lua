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
SpellFXOverrideSkins = {
  "UnderworldTwistedFate",
  "TwistedFateSkin08"
}
PreLoadBuildingBlocks = {
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
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender10vision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twistedfategatetarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotsgate"
    }
  }
}
