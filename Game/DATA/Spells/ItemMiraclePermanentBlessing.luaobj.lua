NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3173_Eleisas_Miracle.dds"
BuffName = "ItemMiraclePermanentBlessing"
SpellToggleSlot = 1
PersistsThroughDeath = true
NonDispellable = true
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eleisas_miracle_upgrade.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
