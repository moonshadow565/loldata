BuffTextureName = "3084_Widowmaker.dds"
BuffName = "Lightslicer"
AutoBuffActivateEffect = "OntheHunt_buf.troy"
AutoBuffActivateAttachBoneName = "root"
AutoBuffActivateEffect2 = "OntheHuntBase_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "LightstrikerBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorPenetrationMod,
      TargetVar = "Owner",
      Delta = 30
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "lightstrikerbuff"
    }
  }
}
