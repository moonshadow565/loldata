NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Pirate_RaiseMorale.dds"
BuffName = "RaiseMorale"
AutoBuffActivateEffect = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName = "L_Hand"
AutoBuffActivateEffect2 = "pirate_attack_buf_01.troy"
AutoBuffActivateAttachBoneName2 = "R_Hand"
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkeone"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blindmonkemanager"
    }
  }
}
