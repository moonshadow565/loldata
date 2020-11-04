NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Sona_W.dds"
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
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_w_zone_self.troy"
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
