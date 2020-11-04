NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Summoner_revive.dds"
BuffName = "SummonerReviveSpeedBoost"
AutoBuffActivateEffect = "ArmordilloSpin.troy"
AutoBuffActivateEffect2 = "Powerball_buf.troy"
SpellToggleSlot = 1
PersistsThroughDeath = true
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemmiracleboost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemmiraclepermanentblessing"
    }
  }
}
