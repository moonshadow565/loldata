NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "BlindMonkEOne.dds"
BuffName = "BraumAOEShield"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
SpellFXOverrideSkins = {
  "ReefMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumshieldraise"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumaoeshieldparticlemanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "Braummark"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "Braumaoeshield"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_shieldhit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braumslash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braum_crescent_mis.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braumslash_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Braumslash_tar_red.troy"
    }
  }
}
