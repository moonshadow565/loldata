NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Kayle_R.dds"
BuffName = "JudicatorIntervention"
AutoCooldownByLevel = {
  90,
  90,
  90,
  90,
  90
}
SpellFXOverrideSkins = {
  "MetalWingedJudicator"
}
SpellVOOverrideSkins = {
  "MetalWingedJudicator"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eyeforaneye_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eyeforaneye_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kayleinterventionanim"
    }
  }
}
