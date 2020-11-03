NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_SongofDiscordGold.dds"
BuffName = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscord"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordhaste"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
