NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
SpellFXOverrideSkins = {
  "KhazixDroid",
  "KhazixSkin02"
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
      Name = "khazix_base_q_evo2_singleenemy_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_base_q_evo2_multienemy_tar.troy"
    }
  }
}
