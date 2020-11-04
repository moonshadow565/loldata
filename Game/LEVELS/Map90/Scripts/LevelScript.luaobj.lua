MAX_MINIONS_EVER = 180
TEAM_UNKNOWN = 0
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
DoLuaLevel("BBLuaConversionLibrary")
DoLuaLevel("LaneSigils")
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 15,
  HPUpgradeGrowth = 0.2,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 18.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 12,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 11,
  HPUpgradeGrowth = 0.2,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 13.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 8,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
TestDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "SRU_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "SRU_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "SRU_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "SRU_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "SRU_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "SRU_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "SRU_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "SRU_ChaosMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
OrderTestMinionInfo = {
  MinionName = "Blue_Minion_Basic",
  DefaultInfo = TestDefaultMinionInfo
}
ChaosTestMinionInfo = {
  MinionName = "Red_Minion_Basic",
  DefaultInfo = TestDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster",
    "Test"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo,
  Test = OrderTestMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo,
  Test = ChaosTestMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
NeutralMinionNames = {
  "SRU_Dragon",
  "SRU_Krug",
  "SRU_KrugMini",
  "SRU_Red",
  "SRU_RedMini",
  "SRU_Razorbeak",
  "SRU_RazorbeakMini",
  "SRU_Murkwolf",
  "SRU_MurkwolfMini",
  "SRU_Blue",
  "SRU_BlueMini",
  "SRU_Gromp",
  "SRU_Baron"
}
function CreateLaneBuildingTable()
  local L0_21, L1_22
  L0_21 = {}
  L0_21.Turret3 = true
  L0_21.Turret2 = true
  L0_21.Turret1 = true
  L0_21.Barracks = true
  return L0_21
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function PreloadBarrackCharacters(A0_23)
  local L1_24, L2_25
  for _FORV_6_, _FORV_7_ in pairs(A0_23.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function OnLevelInit()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  for L5_31, L6_32 in L2_28(L3_29) do
    PreloadBarrackCharacters(L6_32)
  end
  for L5_31, L6_32 in L2_28(L3_29) do
    PreloadBarrackCharacters(L6_32)
  end
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L2_28(L3_29)
  L6_32 = L3_29()
  L2_28(L3_29, L4_30, L5_31, L6_32, L3_29())
  L2_28(L3_29, L4_30)
  L2_28()
  L2_28(L3_29, L4_30)
  L2_28.WaveSpawnRate = 30000
  L2_28.SingleMinionSpawnDelay = 800
  L2_28.ExpRadius = L3_29
  L2_28.GoldRadius = L3_29
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  local L0_33, L1_34, L2_35, L3_36, L4_37
  L0_33(L1_34)
  L0_33()
  for L3_36 = RIGHT_LANE, LEFT_LANE do
    L4_37 = GetDampener
    L4_37 = L4_37(TEAM_ORDER, L3_36)
    SetDampenerRespawnAnimationDuration(L4_37, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    L4_37 = GetDampener(TEAM_CHAOS, L3_36)
    SetDampenerRespawnAnimationDuration(L4_37, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
  end
  L0_33(L1_34)
  L0_33(L1_34)
end
function OnGameStartup()
  local L0_38
  L0_38 = SpawnLaneSigilEffects
  L0_38()
  L0_38 = LuaForEachChampion
  L0_38(TEAM_UNKNOWN, "ApplyJungleTracker")
  L0_38 = 0
  OrderHQPos = GetKeyLocation(L0_38, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_38, TEAM_CHAOS)
end
function SetShieldBuffsOnSecondaryTurrets(A0_39)
  local L1_40, L2_41, L3_42, L4_43
  for L4_43 = RIGHT_LANE, LEFT_LANE do
    innerTurret = GetTurret(A0_39, L4_43, MIDDLE_TOWER)
    ApplyPersistentBuff(innerTurret, "SRTurretSecondaryShielder", false, 1, 1)
    AddBuffCounter(innerTurret, "SRTurretSecondaryShielder", L4_43, 2)
  end
end
SPELLBOOK_SUMMONER = 1
function ApplyJungleTracker(A0_44)
  if GetSlotSpellName(A0_44, 0, SPELLBOOK_SUMMONER, 0) == "summonersmite" or GetSlotSpellName(A0_44, 1, SPELLBOOK_SUMMONER, 0) == "summonersmite" then
    ApplyPersistentBuff(A0_44, "ItemJungleStatsTracker", true, 1, 1)
  end
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_45)
  ApplyBaseBuff(A0_45, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_46)
  ApplyBaseBuff(A0_46, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_47, A1_48)
  if (GetPosition(A0_47) - A1_48):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_47, A0_47, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_49)
  if A0_49 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61
  for L4_54 = 1, 2 do
    if L4_54 == 1 then
      L0_50 = OrderBarracksBonuses
    else
      L0_50 = ChaosBarracksBonuses
    end
    for L8_58 = 1, 3 do
      L9_59, L10_60 = nil, nil
      L11_61 = L0_50[L8_58]
      L11_61 = L11_61.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_61) do
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + _FORV_16_.HPUpgrade
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeGrowth
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function AllowDamageOnBuildings()
  local L0_62, L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69
  for L3_65 = RIGHT_LANE, LEFT_LANE do
    for L7_69 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_65, L7_69)
      if orderTurret ~= nil then
        if L7_69 == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_65, L7_69)
      if chaosTurret ~= nil then
        if L7_69 == FRONT_TOWER then
          SetInvulnerable(chaosTurret, false)
          SetTargetable(chaosTurret, true)
        else
          SetInvulnerable(chaosTurret, true)
          SetNotTargetableToTeam(chaosTurret, true, TEAM_ORDER)
        end
      end
    end
  end
end
function ResetToDefaultWaveCounts(A0_70)
  local L1_71, L2_72
  for _FORV_6_, _FORV_7_ in pairs(A0_70) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_73)
  local L1_74, L2_75
  for _FORV_6_, _FORV_7_ in pairs(A0_73) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_76, A1_77)
  local L2_78, L3_79, L4_80
  L2_78 = 0
  L3_79 = TEAM_ORDER
  if A1_77 == L3_79 then
    L3_79 = OrderBarracksBonuses
    L4_80 = A0_76 + 1
    L2_78 = L3_79[L4_80]
  else
    L3_79 = ChaosBarracksBonuses
    L4_80 = A0_76 + 1
    L2_78 = L3_79[L4_80]
  end
  L3_79 = {}
  L4_80 = SpawnTable
  L4_80 = L4_80.WaveSpawnRate
  L3_79.WaveSpawnRate = L4_80
  L4_80 = SpawnTable
  L4_80 = L4_80.SingleMinionSpawnDelay
  L3_79.SingleMinionSpawnDelay = L4_80
  L4_80 = L2_78.IsDestroyed
  L3_79.IsDestroyed = L4_80
  L4_80 = L2_78.MinionInfoTable
  L3_79.MinionInfoTable = L4_80
  ReturnTable = L3_79
  L3_79 = ReturnTable
  return L3_79
end
function GetMinionSpawnInfo(A0_81, A1_82, A2_83, A3_84, A4_85)
  local L5_86, L6_87, L7_88
  L5_86 = 0
  L6_87 = TEAM_ORDER
  if A3_84 == L6_87 then
    L6_87 = OrderBarracksBonuses
    L7_88 = A0_81 + 1
    L5_86 = L6_87[L7_88]
  else
    L6_87 = ChaosBarracksBonuses
    L7_88 = A0_81 + 1
    L5_86 = L6_87[L7_88]
  end
  L6_87 = L5_86.MinionInfoTable
  L6_87 = L6_87.Super
  L7_88 = L5_86.MinionInfoTable
  L7_88 = L7_88.Cannon
  ResetToDefaultWaveCounts(L5_86.MinionInfoTable)
  if A1_82 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_88.NumPerWave = L7_88.NumPerWave + 1
  end
  if A4_85 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_85
  end
  if L5_86.WillSpawnSuperMinion == 1 then
    if A3_84 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_84 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_87.NumPerWave = 2
    else
      L6_87.NumPerWave = 1
    end
    L7_88.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_86.MinionInfoTable)
    L6_87.NumPerWave = L5_86.MinionInfoTable.Super.NumPerWave
    L5_86.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_86.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_86.MinionInfoTable)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_86.SpawnOrderMinionNames,
    IsDestroyed = L5_86.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_86.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_89, A1_90, A2_91)
  local L3_92, L4_93
  L4_93 = TEAM_ORDER
  if A0_89 == L4_93 then
    L3_92 = OrderBuildingStatus
  else
    L3_92 = ChaosBuildingStatus
  end
  L4_93 = FRONT_TOWER
  if A2_91 == L4_93 then
    L4_93 = A1_90 + 1
    L4_93 = L3_92[L4_93]
    L4_93.Turret3 = false
    L4_93 = GetTurret
    L4_93 = L4_93(A0_89, A1_90, MIDDLE_TOWER)
    SetInvulnerable(L4_93, false)
    SetTargetable(L4_93, true)
  else
    L4_93 = MIDDLE_TOWER
    if A2_91 == L4_93 then
      L4_93 = A1_90 + 1
      L4_93 = L3_92[L4_93]
      L4_93.Turret2 = false
      L4_93 = GetTurret
      L4_93 = L4_93(A0_89, A1_90, BACK_TOWER)
      SetInvulnerable(L4_93, false)
      SetTargetable(L4_93, true)
    else
      L4_93 = BACK_TOWER
      if A2_91 == L4_93 then
        L4_93 = A1_90 + 1
        L4_93 = L3_92[L4_93]
        L4_93.Turret1 = false
        L4_93 = GetDampener
        L4_93 = L4_93(A0_89, A1_90)
        SetInvulnerable(L4_93, false)
        SetTargetable(L4_93, true)
      else
        L4_93 = HQ_TOWER2
        if A2_91 == L4_93 then
          L3_92.HQTower2 = false
          L4_93 = L3_92.HQTower1
          if L4_93 == false then
            L4_93 = GetHQ
            L4_93 = L4_93(A0_89)
            SetInvulnerable(L4_93, false)
            SetTargetable(L4_93, true)
          end
        else
          L4_93 = HQ_TOWER1
          if A2_91 == L4_93 then
            L3_92.HQTower1 = false
            L4_93 = L3_92.HQTower2
            if L4_93 == false then
              L4_93 = GetHQ
              L4_93 = L4_93(A0_89)
              SetInvulnerable(L4_93, false)
              SetTargetable(L4_93, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_94, A1_95)
  local L2_96, L3_97, L4_98
  L3_97 = TEAM_ORDER
  if A0_94 == L3_97 then
    L3_97 = OrderBarracksBonuses
    L4_98 = A1_95 + 1
    L2_96 = L3_97[L4_98]
  else
    L3_97 = ChaosBarracksBonuses
    L4_98 = A1_95 + 1
    L2_96 = L3_97[L4_98]
  end
  return L2_96
end
function GetDisableMinionSpawnTime(A0_99, A1_100)
  barrack = GetLuaBarracks(A1_100, A0_99)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_101, A1_102)
  cLangBarracks = GetBarracks(A1_102, A0_101)
  luaBarrack = GetLuaBarracks(A1_102, A0_101)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_101, A1_102))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113
  BonusesCounter = L2_105
  for L5_108 = 1, 3 do
    L6_109, L7_110 = nil, nil
    L8_111 = TEAM_ORDER
    if A0_103 == L8_111 then
      L7_110 = TEAM_CHAOS
      L6_109 = OrderBarracksBonuses
      L8_111 = ChaosBarracksBonuses
      EnemyBarracks = L8_111
    else
      L7_110 = TEAM_ORDER
      L6_109 = ChaosBarracksBonuses
      L8_111 = OrderBarracksBonuses
      EnemyBarracks = L8_111
    end
    L8_111, L9_112 = nil, nil
    L10_113 = L6_109[L5_108]
    L10_113 = L10_113.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_113) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_108 == A1_104 + 1 then
      L6_109[L5_108].WillSpawnSuperMinion = 1
      if A0_103 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_114, A1_115)
  local L2_116, L3_117, L4_118, L5_119, L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127, L14_128, L15_129, L16_130, L17_131, L18_132
  ReductionCounter = L2_116
  for L5_119 = 1, 3 do
    L6_120, L7_121, L8_122 = nil, nil, nil
    L9_123 = TEAM_ORDER
    if A0_114 == L9_123 then
      L8_122 = TEAM_CHAOS
      L6_120 = OrderBarracksBonuses
      L7_121 = ChaosBarracksBonuses
    else
      L8_122 = TEAM_ORDER
      L6_120 = ChaosBarracksBonuses
      L7_121 = OrderBarracksBonuses
    end
    L9_123, L10_124 = nil, nil
    L11_125 = L6_120[L5_119]
    L11_125 = L11_125.MinionInfoTable
    for L15_129, L16_130 in L12_126(L13_127) do
      L17_131 = L16_130.HPBonus
      L18_132 = L16_130.HPInhibitor
      L17_131 = L17_131 - L18_132
      L16_130.HPBonus = L17_131
      L17_131 = L16_130.DamageBonus
      L18_132 = L16_130.DamageInhibitor
      L17_131 = L17_131 - L18_132
      L16_130.DamageBonus = L17_131
      L17_131 = L16_130.ExpGiven
      L18_132 = L16_130.ExpInhibitor
      L17_131 = L17_131 + L18_132
      L16_130.ExpGiven = L17_131
      L17_131 = L16_130.GoldGiven
      L18_132 = L16_130.GoldInhibitor
      L17_131 = L17_131 + L18_132
      L16_130.GoldGiven = L17_131
    end
    if L5_119 == L13_127 then
      if A0_114 == L13_127 then
        totalNumberOfChaosBarracks = L13_127
      else
        totalNumberOfOrderBarracks = L13_127
      end
      L13_127.WillSpawnSuperMinion = 0
    end
    if L12_126 == 3 then
      HQ = L13_127
      L13_127(L14_128, L15_129)
      L13_127(L14_128, L15_129)
      for L16_130 = RIGHT_LANE, LEFT_LANE do
        L17_131 = GetTurret
        L18_132 = L8_122
        L17_131 = L17_131(L18_132, L16_130, HQ_TOWER1)
        L18_132 = GetTurret
        L18_132 = L18_132(L8_122, L16_130, HQ_TOWER2)
        if L17_131 ~= Nil then
          SetInvulnerable(L17_131, true)
          SetNotTargetableToTeam(L17_131, true, A0_114)
        end
        if L18_132 ~= Nil then
          SetInvulnerable(L18_132, true)
          SetNotTargetableToTeam(L18_132, true, A0_114)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_133, A1_134)
  local L2_135
  ReactiveCounter = ReactiveCounter + 1
  L2_135 = OppositeTeam(A0_133)
  dampener = GetDampener(A0_133, A1_134)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_135, A1_134)
end
function DisableSuperMinions(A0_136, A1_137)
  local L2_138, L3_139
  if A0_136 == TEAM_ORDER then
    L2_138 = OrderBarracksBonuses[A1_137 + 1]
    L3_139 = ChaosBarracksBonuses[A1_137 + 1]
  elseif A0_136 == TEAM_CHAOS then
    L2_138 = ChaosBarracksBonuses[A1_137 + 1]
    L3_139 = OrderBarracksBonuses[A1_137 + 1]
  end
  if L3_139 then
    L3_139.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_140)
  local L1_141
  L1_141 = GetTurret
  L1_141 = L1_141(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_140 == 0 then
    ApplyPersistentBuff(L1_141, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_141, "DebugLateGameBuff", false, 1, 1)
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_142)
  local L1_143, L2_144, L3_145
  L1_143 = GetHQType
  L2_144 = A0_142
  L1_143 = L1_143(L2_144)
  HQType = L1_143
  L1_143 = HQType
  L2_144 = ORDER_HQ
  if L1_143 ~= L2_144 then
    L1_143 = HQType
    L2_144 = CHAOS_HQ
  elseif L1_143 == L2_144 then
    L1_143 = HQType
    L2_144 = CHAOS_HQ
    if L1_143 == L2_144 then
      L1_143 = EndOfGameCeremony
      L2_144 = TEAM_ORDER
      L3_145 = A0_142
      L1_143(L2_144, L3_145)
    else
      L1_143 = EndOfGameCeremony
      L2_144 = TEAM_CHAOS
      L3_145 = A0_142
      L1_143(L2_144, L3_145)
    end
    return
  end
  L1_143 = IsDampener
  L2_144 = A0_142
  L1_143 = L1_143(L2_144)
  if L1_143 then
    L1_143 = GetLinkedBarrack
    L2_144 = A0_142
    L1_143 = L1_143(L2_144)
    barrack = L1_143
    L1_143 = GetTeamID
    L2_144 = barrack
    L1_143 = L1_143(L2_144)
    barrackTeam = L1_143
    L1_143 = GetLane
    L2_144 = A0_142
    L1_143 = L1_143(L2_144)
    barrackLane = L1_143
    L1_143 = DisableBarracksSpawn
    L2_144 = barrackLane
    L3_145 = barrackTeam
    L1_143(L2_144, L3_145)
    L1_143 = SetDampenerState
    L2_144 = A0_142
    L3_145 = DampenerRegenerationState
    L1_143(L2_144, L3_145)
    L1_143 = SetInvulnerable
    L2_144 = A0_142
    L3_145 = true
    L1_143(L2_144, L3_145)
    L1_143 = SetTargetable
    L2_144 = A0_142
    L3_145 = false
    L1_143(L2_144, L3_145)
    L1_143 = DisactivatedCounter
    L1_143 = L1_143 + 1
    DisactivatedCounter = L1_143
    L1_143 = GetTurret
    L2_144 = barrackTeam
    L3_145 = 1
    L1_143 = L1_143(L2_144, L3_145, HQ_TOWER1)
    L2_144 = GetTurret
    L3_145 = barrackTeam
    L2_144 = L2_144(L3_145, 1, HQ_TOWER2)
    L3_145 = Nil
    if L1_143 ~= L3_145 then
      L3_145 = SetInvulnerable
      L3_145(L1_143, false)
      L3_145 = SetTargetable
      L3_145(L1_143, true)
    end
    L3_145 = Nil
    if L2_144 ~= L3_145 then
      L3_145 = SetInvulnerable
      L3_145(L2_144, false)
      L3_145 = SetTargetable
      L3_145(L2_144, true)
    end
    L3_145 = Nil
    if L1_143 == L3_145 then
      L3_145 = Nil
      if L2_144 == L3_145 then
        L3_145 = GetHQ
        L3_145 = L3_145(barrackTeam)
        SetInvulnerable(L3_145, false)
        SetTargetable(L3_145, true)
      end
    end
    L3_145 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_145 = TEAM_ORDER
    else
      L3_145 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_145, barrackLane)
  end
  L1_143 = IsTurretAI
  L2_144 = A0_142
  L1_143 = L1_143(L2_144)
  if L1_143 then
    L1_143 = GetTeamID
    L2_144 = A0_142
    L1_143 = L1_143(L2_144)
    L2_144 = GetObjectLaneId
    L3_145 = A0_142
    L2_144 = L2_144(L3_145)
    L3_145 = GetTurretPosition
    L3_145 = L3_145(A0_142)
    DeactivateCorrectStructure(L1_143, L2_144, L3_145)
    return
  end
  L1_143 = GetDampenerType
  L2_144 = A0_142
  L1_143 = L1_143(L2_144)
  if L1_143 > -1 then
    L2_144 = 0
    L3_145 = TEAM_ORDER
    if L1_143 % TEAM_CHAOS >= RIGHT_LANE and L1_143 % TEAM_CHAOS <= LEFT_LANE then
      L2_144 = ChaosBarracksBonuses[L1_143 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_143 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_145 = TEAM_CHAOS
      L2_144 = OrderBarracksBonuses[L1_143 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_143 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_144 = Log
    L3_145 = "Could not find Linking barracks!"
    L2_144(L3_145)
  end
  L2_144 = true
  return L2_144
end
function IncreaseCannonMinionSpawnRate()
  local L1_146
  L1_146 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_146
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_147
  L1_147 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_147
end
function PostGameSetup(A0_148)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_149, A1_150)
  local L2_151, L3_152, L4_153, L5_154, L6_155, L7_156
  for L7_156, _FORV_8_ in L4_153(L5_154) do
    if A0_149 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_156)
      break
    end
  end
end
