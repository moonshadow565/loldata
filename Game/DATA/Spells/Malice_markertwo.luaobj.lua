AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "SilentKiller"
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 3,
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
              CompareOp = CO_GREATER_THAN
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "silentkiller"
    }
  }
}
