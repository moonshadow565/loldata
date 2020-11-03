NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Trundle_Bite.dds"
BuffName = "TrundleQ"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundleq_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globalhit_physical.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundleqdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
