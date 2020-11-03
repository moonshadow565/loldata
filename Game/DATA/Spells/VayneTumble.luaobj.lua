NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Renekton_SliceAndDice.dds"
BuffName = "VayneTumble"
AutoBuffActivateEffect = "Global_Haste.troy"
AutoBuffActivateAttachBoneName = "l_hnd"
AutoBuffActivateEffect2 = "Global_Haste.troy"
AutoBuffActivateAttachBoneName2 = "r_hnd"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_ult_invis_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_q_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_ult_invis_cas_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumble"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblefade"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblefailsafe"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblebonus"
    }
  }
}
