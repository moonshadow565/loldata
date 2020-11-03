NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Wolfman_Bloodscent.dds"
BuffName = "Haste"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
AutoCooldownByLevel = {
  45,
  40,
  35,
  30,
  25
}
SpellVOOverrideSkins = {
  "HyenaWarwick"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "wolfman_bloodscent_activate_speed.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "wolfman_bloodscent_activate_blood_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "wolfman_bloodscent_activate_blood_buff_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bloodscent_internal"
    }
  }
}
