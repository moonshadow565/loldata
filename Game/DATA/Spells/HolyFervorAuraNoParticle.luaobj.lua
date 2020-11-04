BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "Holy Fervor"
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 2000,
          Flags = "AffectFriends AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Unit",
              BuffName = "HolyFervorAura"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Unit",
                  BuffName = "HolyFervorAuraDuplicate",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 4,
                  NumberStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
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
      Name = "holyfervoraura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "holyfervorauraduplicate"
    }
  }
}
