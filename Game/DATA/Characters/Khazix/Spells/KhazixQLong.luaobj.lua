NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
SpellFXOverrideSkins = {
  "KhazixDroid"
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
      Name = "khazix_q_evolved_alone_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_q_evolved_tar.troy"
    }
  }
}
