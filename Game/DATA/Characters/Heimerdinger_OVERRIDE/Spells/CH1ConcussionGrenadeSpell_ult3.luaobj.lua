NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Slow.dds"
BuffName = "Slow"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
AutoBuffActivateAttachBoneName = "root"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_ch1_grenade_tar_ult2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_ch1_grenade_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingersuperenergy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerrocketcharge"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ch1concussiongrenademarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerturretlockon"
    }
  }
}
