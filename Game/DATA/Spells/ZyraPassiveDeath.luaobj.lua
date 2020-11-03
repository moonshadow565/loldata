NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianSurprise"
AutoBuffActivateEffect = "KogMawIcathianSurprise_foam.troy"
AutoBuffActivateAttachBoneName = "C_Mouth_d"
AutoBuffActivateEffect2 = "KogMawIcathianSurprise_splats.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "xaraseed"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "xaraseed"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xaragraspingroots"
    }
  }
}
