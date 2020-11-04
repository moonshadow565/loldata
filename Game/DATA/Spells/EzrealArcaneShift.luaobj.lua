NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Voidwalker_Riftwalk.dds"
BuffName = "RiftWalk"
AutoBuffActivateEffect = ""
SpellFXOverrideSkins = {
  "CyberEzreal"
}
AutoBuffActivateEvent = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_cas_pulsefire.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_flash_pulsefire.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_arcaneshift_flash.troy"
    }
  }
}
