NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Jayce_HextechCapacitor_Hammer.dds"
BuffName = "JaycePassiveMeleeAttack"
AutoBuffActivateEffect = "JaycePassiveReadyMelee.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_WEAPON_1"
AutoBuffActivateEffect2 = "JaycePassiveReadyMelee.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_WEAPON_GAP_1"
AutoBuffActivateEffect3 = "JaycePassiveReadyMelee.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_WEAPON_GAP_2"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit_skn1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit_skn2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit.troy"
    }
  }
}
