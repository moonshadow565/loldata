NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "RivenBladeoftheExile.dds"
BuffName = "RivenFengShuiEngine"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
SpellToggleSlot = 4
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_ult_blade_swap_base.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_ult_attack_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenwindslashready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenizunablade"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenfengshuiengine"
    }
  }
}
