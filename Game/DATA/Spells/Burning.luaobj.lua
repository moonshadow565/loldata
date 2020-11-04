BuffTextureName = "Annie_Incinerate.dds"
BuffName = "Burning"
AutoBuffActivateEffect = "Cape_neg_buf.troy"
AutoBuffActivateEffect2 = "GLOBAL_SLOW.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TickDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "TickDamage",
      DamageVarTable = "InstanceVars",
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_PROC,
      PercentOfAttack = 1,
      SpellDamageRatio = 0
    }
  }
}
