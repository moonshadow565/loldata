NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3042_Muramana.dds"
BuffName = "Muramana"
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
PersistsThroughDeath = true
NonDispellable = true
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "muramana"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "corki_misslebarrage_std_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "itemmuramana.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramanadot"
    }
  }
}
