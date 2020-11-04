NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_fortify.dds"
BuffName = "FortifyBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "GoldAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncGold,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "GoldAmount",
      DeltaVarTable = "InstanceVars"
    }
  }
}
