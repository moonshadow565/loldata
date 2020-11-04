NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "SkarnerVirulentSlash.dds"
BuffName = "KhazixPDamage"
SpellFXOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_alone_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_alone_ring.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_alone_fear.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_alone_fear_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_alone_buf_minion.troy"
    }
  }
}
