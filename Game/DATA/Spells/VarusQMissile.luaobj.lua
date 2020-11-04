NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "KogMaw_VoidOoze.dds"
BuffName = "EzrealEssenceFluxDebuff"
SpellFXOverrideSkins = {
  "VarusAscended"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varusqspellshieldcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdetonate"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "varusqhit"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusqhit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "varusqhitminion.troy"
    }
  }
}
