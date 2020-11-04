NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "MordekaiserMaceOfSpades.dds"
BuffName = "MordekaiserMaceOfSpades"
AutoBuffActivateEffect2 = "mordakaiser_maceOfSpades_activate.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_WEAPON_1"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisersyphonparticle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordakaiser_maceofspades_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisermaceofspadesdmg"
    }
  }
}
