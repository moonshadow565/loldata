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
      Name = "Khazix_Base_Q_Evo2_SingleEnemy_Tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Khazix_Base_Q_Evo2_MultiEnemy_Tar.troy"
    }
  }
}
