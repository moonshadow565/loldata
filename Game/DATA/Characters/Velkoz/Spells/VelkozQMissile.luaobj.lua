NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
SpellFXOverrideSkins = {
  "VelkozSkin01"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozqmissiledamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozqsplitactivate"
    }
  }
}
