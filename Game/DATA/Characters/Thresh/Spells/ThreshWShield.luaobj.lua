NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Armsmaster_CoupDeGrace.dds"
BuffName = "ThreshWShield"
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_w_shield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_w_shield_break.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eyeofthestorm_break.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jannaeotsbuff"
    }
  }
}
