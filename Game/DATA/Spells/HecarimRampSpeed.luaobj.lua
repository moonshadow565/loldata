NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Hecarim_DevastingCharge.dds"
BuffName = "HecarimRamp"
AutoBuffActivateEffect = "Hecarim_E_buf.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CENTER_LOC"
AutoBuffActivateEffect2 = "Hecarim_E_weapon_buf.troy"
AutoBuffActivateAttachBoneName2 = "Weapon"
AutoBuffActivateEffect3 = "Hecarim_E_weapon_buf2.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_GLB_WEAPON_1"
SpellToggleSlot = 1
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrampminion"
    }
  }
}
