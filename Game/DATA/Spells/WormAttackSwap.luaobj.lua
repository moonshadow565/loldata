NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "KarmaMantraActivate.dds"
BuffName = "KarmaMantraEnergized"
AutoBuffActivateEffect = "karma_matraCharge_self.troy"
SpellToggleSlot = 4
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "wormattack"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wormattackinitial"
    }
  }
}
