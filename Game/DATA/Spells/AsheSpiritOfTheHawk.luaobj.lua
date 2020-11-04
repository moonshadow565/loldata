NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 0.5
PersistsThroughDeath = true
NonDispellable = true
BuffOnMissileEndBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "AsheSpiritOfTheHawk",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "teamID"}
      },
      {
        Function = BBAddPosPerceptionBubble,
        Params = {
          TeamVar = "teamID",
          Radius = 1150,
          PosVar = "MissileEndPosition",
          Duration = 5,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "BubbleID"
        }
      }
    }
  }
}
