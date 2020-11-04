NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Wolfman_Bloodscent.dds"
BuffName = "Haste"
AutoBuffActivateEffect = "Bloodscent_buf.troy"
AutoBuffActivateAttachBoneName = "root"
SpellToggleSlot = 3
AutoCooldownByLevel = {
  45,
  40,
  35,
  30,
  25
}
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedBuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Attacker",
      DeltaVar = "MoveSpeedBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
