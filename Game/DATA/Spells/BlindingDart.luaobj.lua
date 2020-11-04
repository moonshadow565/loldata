NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Teemo_TranquilizingShot.dds"
BuffName = "Blind"
AutoBuffActivateEffect = "Global_miss.troy"
AutoBuffActivateAttachBoneName = "head"
SpellFXOverrideSkins = {
  "AstronautTeemo"
}
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
      BuffAddType = BUFF_STACKS_AND_OVERLAPS,
      StacksExclusive = true,
      BuffType = BUFF_Blind,
      MaxStack = 100,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        1.5,
        1.75,
        2,
        2.25,
        2.5
      },
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        80,
        125,
        170,
        215,
        260
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.8,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
