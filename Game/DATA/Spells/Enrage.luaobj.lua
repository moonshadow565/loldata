NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Sion_SpiritRage.dds"
BuffName = "Enrage"
AutoBuffActivateEffect = "Enrageweapon_buf.troy"
AutoBuffActivateAttachBoneName = "weapon_tip"
SpellToggleSlot = 3
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "enrage"}
  }
}
