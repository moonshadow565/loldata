NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Sona_HymnofValor.dds"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaqproctracker"
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
