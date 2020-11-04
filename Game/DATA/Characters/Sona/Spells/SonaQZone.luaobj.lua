NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Sona_Q.dds"
BuffName = "SonaQZone"
SpellDamageRatio = 1
SpellFXOverrideSkins = {"PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_q_zone.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_q_zone_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaqprocattacker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sonaqzone"}
  }
}
