NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Minotaur_TriumphantRoar.dds"
BuffName = "Stun"
AutoBuffActivateEffect = "Stun_glb.troy"
AutoBuffActivateAttachBoneName = "head"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turntostone.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "turnback.troy"
    }
  }
}
