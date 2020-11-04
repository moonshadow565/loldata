BuffTextureName = "Malphite_GraniteShield.dds"
BuffName = "MalphiteObduracyEffect"
AutoBuffActivateEffect = ""
NonDispellable = true
OnPreDamagePriority = 3
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "malphiteshieldremoval"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "malphiteshieldbeenhit"
    }
  }
}
