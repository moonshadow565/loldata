NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "FallenAngel_TormentedSoil.dds"
BuffName = "ThreshWZoneBuff"
AutoBuffActivateAttachBoneName3 = "R_hand"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_thresh_wzonearms.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_q_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "brandconflagration_mis.troy"
    }
  }
}
