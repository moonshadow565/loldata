NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Shen_Feint.dds"
BuffName = "Shen Feint Buff"
AutoBuffActivateEffect = "LuxPrismaticWave_shield.troy"
AutoBuffActivateAttachBoneName = ""
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenwindslashready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenfengshuiengine"
    }
  }
}
