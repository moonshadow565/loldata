NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Viktor_Q2.dds"
BuffName = "ViktorPowerTransferReturn"
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
PersistsThroughDeath = true
NonDispellable = true
TriggersSpellCasts = true
SetSpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "viktorqbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_skin03_q_aug_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_base_q_aug_buff.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "viktor_base_q_aug_attack_cas.troy"
    }
  }
}
