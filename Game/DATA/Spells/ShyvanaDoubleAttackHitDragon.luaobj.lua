NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Wolfman_SeverArmor.dds"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanadoubleattackhitdragon"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_doubleattack_tar.troy"
    }
  }
}
