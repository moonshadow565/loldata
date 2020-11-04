NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_BearStance.dds"
BuffName = "UdyrBearStance"
AutoBuffActivateEffect = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "Global_DmgHands_buf.troy"
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
