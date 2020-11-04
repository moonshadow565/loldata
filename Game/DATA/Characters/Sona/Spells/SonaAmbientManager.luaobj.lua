NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Sona_AriaofPerseverance.dds"
BuffName = "SonaWZone"
SpellDamageRatio = 1
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaambientqsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaambientwsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaambientesound"
    }
  }
}
