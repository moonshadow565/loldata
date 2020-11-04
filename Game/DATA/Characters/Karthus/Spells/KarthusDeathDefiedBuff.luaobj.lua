BuffTextureName = "Karthus_Passive.dds"
BuffName = "Death Defied Buff"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_avatar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_distortavatar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_explosion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karthus_base_p_death_fade.troy"
    }
  }
}
