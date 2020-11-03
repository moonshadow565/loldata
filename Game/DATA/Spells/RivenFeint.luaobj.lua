NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "RivenPathoftheExile.dds"
BuffName = "RivenFeint"
AutoBuffActivateEffect = "exile_E_shield_01.troy"
AutoBuffActivateAttachBoneName = ""
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_e_interupt.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "exile_e_mis.troy  "
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riventricleave"
    }
  }
}
