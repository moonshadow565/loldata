NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Judicator_EyeforanEye.dds"
BuffName = "JudicatorIntervention"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  90,
  90,
  90,
  90,
  90
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
