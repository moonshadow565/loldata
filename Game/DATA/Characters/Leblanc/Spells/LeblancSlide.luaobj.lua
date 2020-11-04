DoesntBreakShields = true
BuffTextureName = "LeblancDisplacementReturn.dds"
BuffName = "LeblancDisplacement"
SpellToggleSlot = 2
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidereturn"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_return_trigger.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidemove"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidewallfix"
    }
  }
}
