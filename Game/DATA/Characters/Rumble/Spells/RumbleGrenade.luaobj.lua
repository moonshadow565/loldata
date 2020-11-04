NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Rumble_Electro Harpoon.dds"
BuffName = "RumbleGrenade"
SpellToggleSlot = 3
SpellFXOverrideSkins = {
  "RumbleSkin03"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadecd"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadedz"
    }
  }
}
