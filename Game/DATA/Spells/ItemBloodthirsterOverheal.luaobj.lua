NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "2222_Transmutation_Crystal.dds"
BuffName = "LuxShield"
OnPreDamagePriority = 3
SpellFXOverrideSkins = {
  "SteelLegionLux"
}
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itembtoverhealtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "item_btoverheal_proc.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "item_btoverheal_shield.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itembtoverhealdecay"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "item_btoverheal_decay.troy"
    }
  }
}
