NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Ashe_Q_Debuff.dds"
BuffName = "FrostArrow"
AutoBuffActivateEffect = "Global_Freeze.troy"
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
