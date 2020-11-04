NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KarmaSoulShield.dds"
BuffName = "KarmaSoulShield"
OnPreDamagePriority = 3
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_soulshield_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karmasoulshieldsound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmasoulshieldanim"
    }
  }
}
