NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "RivenPathoftheExile.dds"
BuffName = "RivenFeint"
AutoBuffActivateEffect = "Riven_Base_E_Shield.troy"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {
  "RivenSkin05"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riven_base_e_interupt.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "riven_base_e_mis.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleaveghost"
    }
  }
}
