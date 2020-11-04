NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "SwainRavenousFlock.dds"
BuffName = "SwainMetamorphism"
SpellToggleSlot = 4
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_metamorph.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_metamorph_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "swain_demonform_idle.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nightmarebotspiritswainmetanuke"
    }
  }
}
