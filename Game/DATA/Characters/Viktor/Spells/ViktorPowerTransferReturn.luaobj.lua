NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ViktorPowerTransfer.dds"
BuffName = "ViktorShield"
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = true
SetSpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_reverb_shield.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorpowertransferreturn"
    }
  }
}
