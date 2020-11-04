NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoiaTarget"
SpellFXOverrideSkins = {
  "CyberNocturne"
}
AutoBuffActivateEvent = "DeathsCaress_buf.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafriendcyber.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafriend.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafoe.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiafoecyber.troy"
    }
  }
}
