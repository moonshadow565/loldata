NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Vladimir_SanguinePool.dds"
BuffName = "VladimirSanguinePool"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "BloodkingVladimir"
}
SpellVOOverrideSkins = {
  "BloodkingVladimir"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladsanguinepool_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vlad_bloodking_blood_skin.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirsanguinepoolparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirsanguinepoolslow"
    }
  }
}
