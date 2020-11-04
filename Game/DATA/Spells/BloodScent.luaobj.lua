NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Wolfman_Bloodscent.dds"
BuffName = "Haste"
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
