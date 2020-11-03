DoesntBreakShields = true
DoesntTriggerSpellCasts = true
BuffTextureName = "YorickRavenousPH.dds"
AutoBuffActivateEffect = "yorick_ravenousGhoul_self_buf.troy"
AutoBuffActivateAttachBoneName = "l_buffbone_glb_hand_loc"
AutoBuffActivateEffect2 = "yorick_ravenousGhoul_self_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_buffbone_glb_hand_loc"
AutoBuffActivateEffect3 = "yorick_ravenousGhoul_self_buf_spirits.troy"
AutoBuffActivateAttachBoneName3 = "c_buffbone_glb_center_loc"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LifestealPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "LifestealPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentLifeStealMod,
      TargetVar = "Owner",
      DeltaVar = "LifestealPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
