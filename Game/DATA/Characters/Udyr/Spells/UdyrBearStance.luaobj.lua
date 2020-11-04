NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_BearStance.dds"
BuffName = "UdyrBearStance"
AutoBuffActivateEffect3 = "Udyr_Spirit_Bear_Arms_R.troy"
AutoBuffActivateAttachBoneName3 = "R_hand"
AutoBuffActivateEffect4 = "Udyr_Spirit_Bear_Arms_L.troy"
AutoBuffActivateAttachBoneName4 = "L_Hand"
SpellToggleSlot = 3
PersistsThroughDeath = true
SpellFXOverrideSkins = {"SpiritUdyr"}
SpellVOOverrideSkins = {"SpiritUdyr"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrult"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrturtle"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyr"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spirit_bear_skin.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spiritguard_audio_bear.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearattackult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrspiritbearattackult"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrspiritbearrunstart"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearactivation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrspiritbearattacksfx"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spiritguard_audio_bearstunattack.troy"
    }
  }
}
