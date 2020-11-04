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
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_w_zone.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonawshieldtracker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonawshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonawzone"}
  }
}
