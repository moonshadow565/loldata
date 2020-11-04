NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
CastTime = 0.5
BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "EvelynnWActive"
AutoBuffActivateEffect = "Evelynn_W_active_buf.troy"
SpellToggleSlot = 2
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelynn_w_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "evelynnw"}
  }
}
