NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3057_Sheen.dds"
BuffName = "HecarimRampAttack"
AutoBuffActivateEffect = "Hecarim_E_weapon_buf.troy"
AutoBuffActivateAttachBoneName = "Weapon"
AutoBuffActivateEffect2 = "Hecarim_E_weapon_buf2.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_GLB_WEAPON_1"
SpellToggleSlot = 1
AutoBuffActivateEffectFlags = EFFCREATE_UPDATE_ORIENTATION
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimramp"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrampmidair"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimvision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimrampstuncheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_e_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarimtempslashsound.troy"
    }
  }
}
