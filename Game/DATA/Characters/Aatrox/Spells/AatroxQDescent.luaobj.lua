NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_Q.dds"
BuffName = "AatroxQ"
AutoCooldownByLevel = {
  20,
  18,
  16,
  14,
  12
}
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "RocketTristana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Q_Land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Aatrox_Base_Q_Hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxqknockup"
    }
  }
}
