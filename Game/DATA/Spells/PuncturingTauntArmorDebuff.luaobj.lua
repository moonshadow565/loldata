NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Armordillo_ScaledPlating.dds"
BuffName = "PuncturingTaunt"
AutoBuffActivateEffect = "global_taunt.troy"
AutoBuffActivateAttachBoneName = "head"
PopupMessage1 = "game_floatingtext_Taunted"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorDebuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorDebuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
