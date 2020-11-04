NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "FallenAngel_BlackShield.dds"
BuffName = "Black Shield"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  16,
  16,
  16,
  16,
  16
}
OnPreDamagePriority = 2
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_blackthorn_blackshield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_spellimmunity.troy"
    }
  }
}
