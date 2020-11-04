NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Teemo_PoisonedDart.dds"
BuffName = "Toxic Attack"
AutoBuffActivateEffect = ""
SpellToggleSlot = 3
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCostPerAttack",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1
    }
  }
}
