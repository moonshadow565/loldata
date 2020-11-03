NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Nasus_AvatarOfDeath.dds"
BuffName = "GodofDeath"
AutoBuffActivateEffect = "nassus_godofDeath_sword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "nassus_godofDeath_overhead.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateEffect3 = "nassus_godofDeath_overhead.troy"
AutoBuffActivateAttachBoneName3 = "L_hand"
AutoBuffActivateEffect4 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_godofdeath_aura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_godofdeath_transform.troy"
    }
  }
}
