NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "MaokaiTrunkLineMissile"
SpellFXOverrideSkins = {
  "BraumSkin01"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "braum_base_q_hit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "braumqslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "braummark"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "braummarkcounter"
    }
  }
}
