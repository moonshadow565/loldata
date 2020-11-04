DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Malphite_BrutalStrikes.dds"
BuffName = "MalphiteCleave"
PersistsThroughDeath = true
Nondispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CleavePerc",
      SrcValueByLevel = {
        0.3,
        0.35,
        0.4,
        0.45,
        0.5
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "CleavePerc",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount2",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 200,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Target",
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageAmount2",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0
            }
          }
        }
      }
    }
  }
}
