BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoia"
SpellFXOverrideSkins = {
  "CyberNocturne"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiadash_trail.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiadash_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturne_cyber_paranoiadash_tar.troy"
    }
  }
}
