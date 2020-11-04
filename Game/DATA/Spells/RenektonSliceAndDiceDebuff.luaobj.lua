NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Dice.dds"
BuffName = "RenektonSliceAndDiceShred"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorShred",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorShred",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
