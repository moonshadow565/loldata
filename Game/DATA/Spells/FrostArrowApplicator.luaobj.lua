NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "122_Frozen_Heart.dds"
BuffName = "FrostArrow"
AutoBuffActivateEffect = "Global_Freeze.troy"
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
