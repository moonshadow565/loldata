NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Irelia_TranscendentBladesReady.dds"
BuffName = "IreliaTranscendentBlades"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_frostblade_ult_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_ult_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  }
}
