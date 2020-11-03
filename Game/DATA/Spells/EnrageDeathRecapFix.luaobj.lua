NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Sion_SpiritRage.dds"
BuffName = "Enrage"
AutoBuffActivateEffect = "Enrageweapon_buf.troy"
AutoBuffActivateAttachBoneName = "weapon_tip"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
SpellToggleSlot = 3
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "EnrageDeathRecapFix"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_SUBTRACT
    }
  }
}
