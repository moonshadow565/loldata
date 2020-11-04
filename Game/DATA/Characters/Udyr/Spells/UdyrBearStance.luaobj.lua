NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_BearStance.dds"
BuffName = "UdyrBearStance"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateAttachBoneName2 = "L_hand"
SpellToggleSlot = 3
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyr"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearactivation"
    }
  }
}
