NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "YorickOmenOfDeath.dds"
BuffName = "YorickReviveAllyGuide"
SpellToggleSlot = 4
SpellDamageRatio = 0.5
IsPetDurationBuff = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "petcommandparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cursor_moveto.troy"
    }
  }
}
