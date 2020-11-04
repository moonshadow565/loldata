NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffName = "QuinnW"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {
  "PhoenixQuinn",
  "QuinnValor_Phoenix"
}
DoOnPreDamageInExpirationOrder = true
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "quinnwvision"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "quinn_w_cas_nova.troy"
    }
  }
}
