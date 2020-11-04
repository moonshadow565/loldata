NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ViktorPowerTransfer.dds"
BuffName = "ViktorShield"
AutoBuffActivateEffect = "Viktor_Reverb_shield.troy"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorpowertransferhaste"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorpowertransferreturn"
    }
  }
}
