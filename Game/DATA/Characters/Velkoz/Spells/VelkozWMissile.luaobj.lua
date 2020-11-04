NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
SpellFXOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozwdamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_w_turret_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "velkozwendhack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "velkoz_base_w_orb_implode.troy"
    }
  }
}
