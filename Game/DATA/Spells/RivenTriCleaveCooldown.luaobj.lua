NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Riven_Buffer.dds"
BuffName = "RivenTriCleaveBuff"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleavecooldown"
    }
  }
}
