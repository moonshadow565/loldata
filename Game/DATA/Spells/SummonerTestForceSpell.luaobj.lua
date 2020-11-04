NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "Summoner_boost.dds"
BuffName = "Cleanse"
AutoBuffActivateEffect = ""
SelfExecuteBuildingBlocks = {
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 3000,
      Flags = "AffectEnemies AffectNeutral AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Unit",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Level",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncSpellLevel,
            Params = {
              SpellSlotOwnerVar = "Unit",
              SpellSlot = 0,
              SlotType = SpellSlots
            }
          }
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Unit",
          TargetVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = SpellSlots,
          OverrideForceLevel = 0,
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  }
}
