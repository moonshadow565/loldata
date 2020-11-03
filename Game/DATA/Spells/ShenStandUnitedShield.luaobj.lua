NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Shen_StandUnited.dds"
BuffName = "Shen Stand United Shield"
AutoBuffActivateEffect = ""
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_standunited_shield_v2.troy"
    }
  }
}
