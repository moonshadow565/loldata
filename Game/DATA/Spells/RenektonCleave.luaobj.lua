NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimationcleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonreignofthetyrant"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektoncleave_trail_rage.troy "
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektoncleavedrain"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonrageready"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renektoncleave_trail.troy "
    }
  }
}
