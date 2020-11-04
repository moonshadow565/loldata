NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "GSB_Stun.dds"
BuffName = "Shen Destabilize"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "isninja"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "globallifesteal_buf.troy"
    }
  }
}
