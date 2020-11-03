NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "Evelynn_OutOfStealth.dds"
BuffName = "ShadowWalkRevealed"
AutoBuffActivateEffect = "global_Watched.troy"
AutoBuffActivateAttachBoneName = "head"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelyn_invis_cas.troy"
    }
  }
}
