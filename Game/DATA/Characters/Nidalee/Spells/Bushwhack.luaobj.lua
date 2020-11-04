NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Bowmaster_ArchersMark.dds"
SpellFXOverrideSkins = {
  "HeadhunterNidalee"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_w_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_extra_trap_particle.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_w_tc_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_w_tc_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_bushwhack_trigger_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_base_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bushwhackdamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nidaleepassivehunted"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "noxious trap"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "nidalee_spear"
    }
  }
}
