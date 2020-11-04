NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Janna_EyeOfTheStorm.dds"
BuffName = "Eye Of The Storm"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {
  "JannaForecast"
}
SpellVOOverrideSkins = {
  "JannaForecast"
}
DoOnPreDamageInExpirationOrder = true
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eyeofthestorm_frost_ally_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eyeofthestorm_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jannaeotsbuff"
    }
  }
}
