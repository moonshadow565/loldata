NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "dr_mundo_burning_agony_cas_02.troy"
AutoBuffActivateAttachBoneName = "root"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_damacianjustice_cas_instant.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_damacianjustice_cas_sword.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenbladestorm"
    }
  }
}
