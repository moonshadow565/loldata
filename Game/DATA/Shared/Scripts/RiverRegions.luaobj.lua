local L0, L1
function L0()
  local L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15, L16, L17
  L0 = Make3DPoint
  L1 = 10500
  L2 = 0
  L3 = 5000
  L0 = L0(L1, L2, L3)
  L1 = Make3DPoint
  L2 = 4200
  L3 = 0
  L4 = 9800
  L1 = L1(L2, L3, L4)
  L2 = GetMyPos
  L2 = L2()
  L2 = L2 - L0
  L3 = L2
  L2 = L2.lengthSq
  L2 = L2(L3)
  L3 = GetMyPos
  L3 = L3()
  L3 = L3 - L1
  L4 = L3
  L3 = L3.lengthSq
  L3 = L3(L4)
  if L2 > L3 then
    L2 = {}
    L3 = Make3DPoint
    L4 = 3150
    L5 = 0
    L6 = 11500
    L3 = L3(L4, L5, L6)
    L2.StartPos = L3
    L3 = Make3DPoint
    L4 = 6400
    L5 = 0
    L6 = 8400
    L3 = L3(L4, L5, L6)
    L2.EndPos = L3
    L2.Dest = 4
    L2.Dir = -1
    L3 = {}
    L4 = Make3DPoint
    L5 = 3150
    L6 = 0
    L7 = 11500
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 3050
    L7 = 0
    L8 = 11570
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 3450
    L8 = 0
    L9 = 11060
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 3530
    L9 = 0
    L10 = 10660
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 3720
    L10 = 0
    L11 = 9920
    L8 = L8(L9, L10, L11)
    L9 = Make3DPoint
    L10 = 4030
    L11 = 0
    L12 = 9460
    L9 = L9(L10, L11, L12)
    L10 = Make3DPoint
    L11 = 4710
    L12 = 0
    L13 = 9190
    L10 = L10(L11, L12, L13)
    L11 = Make3DPoint
    L12 = 5240
    L13 = 0
    L14 = 8950
    L11 = L11(L12, L13, L14)
    L12 = Make3DPoint
    L13 = 5890
    L14 = 0
    L15 = 8810
    L12 = L12(L13, L14, L15)
    L13 = Make3DPoint
    L14 = 6200
    L15 = 0
    L16 = 8580
    L13 = L13(L14, L15, L16)
    L14 = Make3DPoint
    L15 = 6400
    L16 = 0
    L17 = 8400
    L14, L15, L16, L17 = L14(L15, L16, L17)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.Path = L3
    L3 = {}
    L4 = Make3DPoint
    L5 = 2840
    L6 = 0
    L7 = 11270
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 3100
    L7 = 0
    L8 = 11500
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 3800
    L8 = 0
    L9 = 11000
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 4500
    L9 = 0
    L10 = 9900
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 6750
    L10 = 0
    L11 = 8650
    L8, L9, L10, L11, L12, L13, L14, L15, L16, L17 = L8(L9, L10, L11)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.TopBorder = L3
    L2.CenterPos = L1
    L3 = {}
    L4 = Make3DPoint
    L5 = 2840
    L6 = 0
    L7 = 11270
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 3600
    L7 = 0
    L8 = 9700
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 4700
    L8 = 0
    L9 = 8900
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 6115
    L9 = 0
    L10 = 8100
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 6800
    L10 = 0
    L11 = 8600
    L8, L9, L10, L11, L12, L13, L14, L15, L16, L17 = L8(L9, L10, L11)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.BottomBorder = L3
    River = L2
  else
    L2 = {}
    L3 = Make3DPoint
    L4 = 11500
    L5 = 0
    L6 = 4000
    L3 = L3(L4, L5, L6)
    L2.StartPos = L3
    L3 = Make3DPoint
    L4 = 8500
    L5 = 0
    L6 = 6300
    L3 = L3(L4, L5, L6)
    L2.EndPos = L3
    L2.Dest = 4
    L2.Dir = -1
    L3 = {}
    L4 = Make3DPoint
    L5 = 11500
    L6 = 0
    L7 = 4000
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 11540
    L7 = 0
    L8 = 3510
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 11380
    L8 = 0
    L9 = 4100
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 11190
    L9 = 0
    L10 = 4660
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 11020
    L10 = 0
    L11 = 5130
    L8 = L8(L9, L10, L11)
    L9 = Make3DPoint
    L10 = 10440
    L11 = 0
    L12 = 5520
    L9 = L9(L10, L11, L12)
    L10 = Make3DPoint
    L11 = 9830
    L12 = 0
    L13 = 5780
    L10 = L10(L11, L12, L13)
    L11 = Make3DPoint
    L12 = 9190
    L13 = 0
    L14 = 6030
    L11 = L11(L12, L13, L14)
    L12 = Make3DPoint
    L13 = 8730
    L14 = 0
    L15 = 6240
    L12 = L12(L13, L14, L15)
    L13 = Make3DPoint
    L14 = 8500
    L15 = 0
    L16 = 6300
    L13, L14, L15, L16, L17 = L13(L14, L15, L16)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.Path = L3
    L2.CenterPos = L0
    L3 = {}
    L4 = Make3DPoint
    L5 = 8150
    L6 = 0
    L7 = 6100
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 8850
    L7 = 0
    L8 = 6650
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 9500
    L8 = 0
    L9 = 6200
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 10800
    L9 = 0
    L10 = 5500
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 11300
    L10 = 0
    L11 = 4900
    L8 = L8(L9, L10, L11)
    L9 = Make3DPoint
    L10 = 11900
    L11 = 0
    L12 = 4000
    L9, L10, L11, L12, L13, L14, L15, L16, L17 = L9(L10, L11, L12)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.TopBorder = L3
    L3 = {}
    L4 = Make3DPoint
    L5 = 8150
    L6 = 0
    L7 = 6100
    L4 = L4(L5, L6, L7)
    L5 = Make3DPoint
    L6 = 9500
    L7 = 0
    L8 = 5300
    L5 = L5(L6, L7, L8)
    L6 = Make3DPoint
    L7 = 10200
    L8 = 0
    L9 = 4800
    L6 = L6(L7, L8, L9)
    L7 = Make3DPoint
    L8 = 11000
    L9 = 0
    L10 = 4100
    L7 = L7(L8, L9, L10)
    L8 = Make3DPoint
    L9 = 11300
    L10 = 0
    L11 = 3900
    L8 = L8(L9, L10, L11)
    L9 = Make3DPoint
    L10 = 11900
    L11 = 0
    L12 = 4000
    L9, L10, L11, L12, L13, L14, L15, L16, L17 = L9(L10, L11, L12)
    L3[1] = L4
    L3[2] = L5
    L3[3] = L6
    L3[4] = L7
    L3[5] = L8
    L3[6] = L9
    L3[7] = L10
    L3[8] = L11
    L3[9] = L12
    L3[10] = L13
    L3[11] = L14
    L3[12] = L15
    L3[13] = L16
    L3[14] = L17
    L2.BottomBorder = L3
    River = L2
  end
end
CreateRiverRegions = L0
function L0()
  local L0, L1
  L0 = River
  L0 = L0.Path
  L1 = River
  L1 = L1.Dest
  L0 = L0[L1]
  return L0
end
GetWaypoint = L0
function L0()
  local L0, L1, L2
  L0 = River
  L0 = L0.Dir
  if L0 == 1 then
    L0 = River
    L0 = L0.Dest
    L1 = River
    L1 = L1.Path
    L1 = #L1
    if L0 == L1 then
      L0 = River
      L0.Dir = -1
    end
  else
    L0 = River
    L0 = L0.Dest
    if L0 == 1 then
      L0 = River
      L0.Dir = 1
    end
  end
  L0 = River
  L1 = River
  L1 = L1.Dest
  L2 = River
  L2 = L2.Dir
  L1 = L1 + L2
  L0.Dest = L1
end
IncrementWaypoint = L0
