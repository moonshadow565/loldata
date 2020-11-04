NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Jayce_HextechCapacitor_Cannon.dds"
BuffName = "JaycePassiveRangedAttack"
AutoBuffActivateEffect = "JaycePassiveReadyRange.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_WEAPON_1"
AutoBuffActivateEffect2 = "JaycePassiveReadyRange.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_WEAPON_GAP_1"
AutoBuffActivateEffect3 = "JaycePassiveReadyRange.troy"
AutoBuffActivateAttachBoneName3 = "BUFFBONE_CSTM_WEAPON_GAP_2"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jaycepassivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit_ranged_skn1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jayce_charged_hit_ranged.troy"
    }
  }
}
