NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "KarmaSoulShield.dds"
BuffName = "KarmaSoulShield"
AutoBuffActivateEffect = ""
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
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_soulshield_buf_mantra.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_souldshiled_ult_unit_tar.troy"
    }
  }
}
