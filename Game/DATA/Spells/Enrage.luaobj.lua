NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Sion_SpiritRage.dds"
BuffName = "Enrage"
AutoBuffActivateEffect = "Enrageweapon_buf.troy"
AutoBuffActivateAttachBoneName = "weapon_tip"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
SpellToggleSlot = 3
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "enrage"}
  }
}
