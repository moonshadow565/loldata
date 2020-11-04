NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Wolfman_InfiniteDuress.dds"
BuffName = "InfiniteDuress"
AutoBuffActivateEffect = "LOC_Suppress.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresschannel"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "infiniteduresssound"
    }
  }
}
