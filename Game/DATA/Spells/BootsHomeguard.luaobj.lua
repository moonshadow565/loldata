NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Summoner_haste.dds"
BuffName = "BootsHomeguard"
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bootshomeguardheal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bootshomeguardspeed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bootshomeguardcounter"
    }
  }
}
