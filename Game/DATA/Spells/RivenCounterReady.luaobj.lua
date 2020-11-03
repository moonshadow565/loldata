NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Dice.dds"
BuffName = "RenekthonSliceAndDiceDelay"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
SpellToggleSlot = 3
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "marthcounterdash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "marthcounterready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "marthcounter"
    }
  }
}
