NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Corki_GatlingGun.dds"
BuffName = "GatlingGunSelf"
SpellToggleSlot = 3
AutoCooldownByLevel = {
  20,
  16,
  12,
  8,
  4
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleflamethrowerbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_gun_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_gun_lite.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_gun_cas.troy"
    }
  }
}
