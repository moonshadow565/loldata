NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
SpellFXOverrideSkins = {
  "KhazixDroid",
  "KhazixSkin03"
}
SpellVOOverrideSkins = {
  "KhazixDroid"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "khazixqdr"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_singleenemy_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_multienemy_tar.troy"
    }
  }
}
