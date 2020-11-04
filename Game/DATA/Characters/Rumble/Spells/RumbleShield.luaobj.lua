NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Rumble_Scrap Shield.dds"
BuffName = "RumbleShield"
AutoBuffActivateEffect = "rumble_shield_01.troy"
AutoBuffActivateAttachBoneName = "robot_root"
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleshieldbuff"
    }
  }
}
