NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "GravesTrueGrit.dds"
BuffName = "GravesPassive"
AutoBuffActivateEffect = ""
PersistsThroughDeath = true
BuffOnUpdateStatsBuildingBlocks = {}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ArmorAmount",
      ValueVarTable = "CharVars",
      Index = 1
    }
  }
}
