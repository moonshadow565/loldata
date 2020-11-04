NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Trundle_Q.dds"
BuffName = "TrundleQ"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_q_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_q_buff_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trundleqreset"
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
    Params = {Name = "trundleq"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trundle_q_bite_tar.troy"
    }
  }
}
