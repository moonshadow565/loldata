BuffTextureName = "Rumble_Junkyard Titan3.dds"
BuffName = "RumbleOverheat"
AutoBuffActivateEffect = "Silence_glb.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "rumble_overheat.troy"
AutoBuffActivateAttachBoneName2 = "spine"
AutoBuffActivateEffect3 = "rumble_overheat_lite.troy"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = "rumble_overheat_lite_02.troy"
AutoBuffActivateAttachBoneName4 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheatsound"
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
    Params = {Name = "infuse"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatingup"
    }
  }
}
