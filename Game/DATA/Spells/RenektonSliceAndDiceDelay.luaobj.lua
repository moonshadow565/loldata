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
      Name = "renektondice"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddicetimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonsliceanddice"
    }
  }
}
