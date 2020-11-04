NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
SpellFXOverrideSkins = {
  "VelkozSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_e_explo.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozestun"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozresearchproc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozresearchapply"
    }
  }
}
