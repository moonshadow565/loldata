NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Ezreal_EssenceFlux.dds"
BuffName = "EzrealEssenceFluxDebuff"
AutoBuffActivateEffect = "GLOBAL_SLOW.troy"
TriggersSpellCasts = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Owner",
      BuffName = "RivenLightsaberMissileDebuff"
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "RivenLightsaberMissileDebuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "HealthPercent",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "HealthPercent",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "BonusRatio",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusRatio",
          Src1Value = 0,
          Src2Value = 0.75,
          DestVar = "BonusRatio",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusRatio",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "BonusRatio",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BonusRatio",
          Src1Value = 2,
          Src2Value = 0,
          DestVar = "BonusRatio",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BonusRatio",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_ADD
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
            120,
            160,
            0,
            0
          },
          Damage = 0,
          DamageType = PHYSICAL_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 0,
          PercentOfAttackVar = "Multiplier",
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0.6,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rivenlightsabermissiledebuff"
    }
  }
}
