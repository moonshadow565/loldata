NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoia"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiateamtarget.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiadash"
    }
  }
}
