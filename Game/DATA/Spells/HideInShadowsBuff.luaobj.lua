BuffTextureName = "Twitch_AlterEgo.dds"
BuffName = "Hide Enrage"
AutoBuffActivateEffect = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName = "r_hand"
AutoBuffActivateEffect2 = "Global_DmgHands_buf.troy"
AutoBuffActivateAttachBoneName2 = "l_hand"
AutoBuffActivateEffect3 = "TwitchBowGlow.troy"
AutoBuffActivateAttachBoneName3 = "weapon"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
