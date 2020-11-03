BuffTextureName = "Maokai_VengefulMaelstromBuff.dds"
BuffName = "MaokaiDrainDefense"
AutoBuffActivateEffect = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaidrain3tally"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maokaidrain3toggle"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maoki_torrent_damage_pulse.troy"
    }
  }
}
