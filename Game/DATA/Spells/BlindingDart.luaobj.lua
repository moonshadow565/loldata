NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Teemo_TranquilizingShot.dds"
BuffName = "Blind"
AutoBuffActivateEffect = "Global_miss.troy"
AutoBuffActivateAttachBoneName = "head"
PopupMessage1 = "game_floatingtext_Blinded"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMissChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMissChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        1.5,
        2.25,
        3,
        3.75,
        4.5
      },
      TickRate = 0
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        90,
        140,
        190,
        240,
        300
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 1
    }
  }
}
