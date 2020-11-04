NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Olaf_W.dds"
BuffName = "OlafFrenziedStrikes"
AutoBuffActivateEffect = "olaf_viciousStrikes_self.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "olaf_viciousStrikes_self.troy"
AutoBuffActivateAttachBoneName2 = "R_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect3 = "olaf_viciousStrikes_axes_blood.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_WEAPON_4"
AutoBuffActivateEffect4 = "olaf_viciousStrikes_axes_blood.troy"
AutoBuffActivateAttachBoneName4 = "BUFFBONE_CSTM_WEAPON_2"
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_viciousstrikes_weapon_glow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_viciousstrikes_heal.troy"
    }
  }
}
