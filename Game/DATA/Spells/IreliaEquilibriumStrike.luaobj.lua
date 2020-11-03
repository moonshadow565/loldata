NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_equilibriumstrike_tar_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_equilibriumstrike_tar_02.troy"
    }
  }
}
