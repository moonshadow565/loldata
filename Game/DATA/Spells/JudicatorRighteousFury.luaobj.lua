NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Kayle_E.dds"
BuffName = "JudicatorRighteousFury"
AutoBuffActivateEffect = "Flamesword.troy"
AutoBuffActivateAttachBoneName = "weapon"
SpellFXOverrideSkins = {
  "MetalWingedJudicator"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kayle_skin07_e_light_lwing.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kayle_skin07_e_light_rwing.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kayle_skin07_e_light_lshoulder.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kayle_skin07_e_light_rshoulder.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "righteousfuryhalo_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kaylerighteousfuryanim"
    }
  }
}
