NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoiaTarget"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargetorder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafriend.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafoe.troy"
    }
  }
}
