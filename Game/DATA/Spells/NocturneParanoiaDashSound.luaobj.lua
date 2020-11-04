NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoiaTarget"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiadashsound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
