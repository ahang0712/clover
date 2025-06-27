; ModuleID = 'wdt_pci_1.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@heartbeat = global i32 60, align 4
@nowayout = global i32 0, align 4
@wdtpci_write_buf = common global i8 0, align 1
@expect_close = common global i32 0, align 4
@count = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@wdt_dc_port = common global i8 0, align 1
@jiffies = common global i64 0, align 8
@dev_count = common global i32 0, align 4
@open_sem = common global i32 0, align 4
@wdtpci_lock = common global i8 0, align 1
@io = common global i32 0, align 4
@irq = common global i32 0, align 4
@wd_heartbeat = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@buf = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @closer_isr_1() #0 !dbg !7 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !9, !tbaa !10
  store i32 42, i32* @expect_close, align 4, !dbg !13, !tbaa !14
  store i32 1, i32* @count, align 4, !dbg !16, !tbaa !14
  %1 = load i32, i32* @count, align 4, !dbg !17, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !17
  br i1 %2, label %3, label %13, !dbg !17

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !18, !tbaa !14
  %5 = icmp ne i32 %4, 0, !dbg !18
  br i1 %5, label %12, label %6, !dbg !19

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !20, !tbaa !10
  %8 = sext i8 %7 to i32, !dbg !20
  %9 = icmp ne i32 %8, 86, !dbg !21
  br i1 %9, label %10, label %11, !dbg !20

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !22, !tbaa !14
  br label %11, !dbg !23

11:                                               ; preds = %10, %6
  br label %12, !dbg !24

12:                                               ; preds = %11, %3
  br label %13, !dbg !25

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !26, !tbaa !14
  %15 = icmp ne i32 %14, 42, !dbg !27
  br i1 %15, label %16, label %17, !dbg !26

16:                                               ; preds = %13
  br label %18, !dbg !28

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !29, !tbaa !14
  %19 = load i32, i32* @cnt1, align 4, !dbg !30, !tbaa !14
  %20 = add nsw i32 %19, 1, !dbg !30
  store i32 %20, i32* @cnt1, align 4, !dbg !30, !tbaa !14
  ret void, !dbg !31
}

; Function Attrs: nounwind uwtable
define void @closer_isr_2() #0 !dbg !32 {
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !33, !tbaa !10
  store i32 42, i32* @expect_close, align 4, !dbg !34, !tbaa !14
  store i32 1, i32* @count, align 4, !dbg !35, !tbaa !14
  %1 = load i32, i32* @count, align 4, !dbg !36, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !36
  br i1 %2, label %3, label %13, !dbg !36

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !37, !tbaa !14
  %5 = icmp ne i32 %4, 0, !dbg !37
  br i1 %5, label %12, label %6, !dbg !38

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !39, !tbaa !10
  %8 = sext i8 %7 to i32, !dbg !39
  %9 = icmp ne i32 %8, 86, !dbg !40
  br i1 %9, label %10, label %11, !dbg !39

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !41, !tbaa !14
  br label %11, !dbg !42

11:                                               ; preds = %10, %6
  br label %12, !dbg !43

12:                                               ; preds = %11, %3
  br label %13, !dbg !44

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !45, !tbaa !14
  %15 = icmp ne i32 %14, 42, !dbg !46
  br i1 %15, label %16, label %17, !dbg !45

16:                                               ; preds = %13
  br label %18, !dbg !47

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !48, !tbaa !14
  %19 = load i32, i32* @cnt2, align 4, !dbg !49, !tbaa !14
  %20 = add nsw i32 %19, 1, !dbg !49
  store i32 %20, i32* @cnt2, align 4, !dbg !49, !tbaa !14
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define void @writer1() #0 !dbg !51 {
  store i32 0, i32* @count, align 4, !dbg !52, !tbaa !14
  store i32 0, i32* @expect_close, align 4, !dbg !53, !tbaa !14
  %1 = load i32, i32* @count, align 4, !dbg !54, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !54
  br i1 %2, label %3, label %13, !dbg !54

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !55, !tbaa !14
  %5 = icmp ne i32 %4, 0, !dbg !55
  br i1 %5, label %12, label %6, !dbg !56

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !57, !tbaa !10
  %8 = sext i8 %7 to i32, !dbg !57
  %9 = icmp ne i32 %8, 86, !dbg !58
  br i1 %9, label %10, label %11, !dbg !57

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !59, !tbaa !14
  br label %11, !dbg !60

11:                                               ; preds = %10, %6
  br label %12, !dbg !61

12:                                               ; preds = %11, %3
  br label %13, !dbg !62

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !63, !tbaa !14
  %15 = add nsw i32 %14, 1, !dbg !63
  store i32 %15, i32* @cnt3, align 4, !dbg !63, !tbaa !14
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @writer2() #0 !dbg !65 {
  store i32 0, i32* @count, align 4, !dbg !66, !tbaa !14
  store i32 0, i32* @expect_close, align 4, !dbg !67, !tbaa !14
  %1 = load i32, i32* @count, align 4, !dbg !68, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !68
  br i1 %2, label %3, label %13, !dbg !68

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !69, !tbaa !14
  %5 = icmp ne i32 %4, 0, !dbg !69
  br i1 %5, label %12, label %6, !dbg !70

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !71, !tbaa !10
  %8 = sext i8 %7 to i32, !dbg !71
  %9 = icmp ne i32 %8, 86, !dbg !72
  br i1 %9, label %10, label %11, !dbg !71

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !73, !tbaa !14
  br label %11, !dbg !74

11:                                               ; preds = %10, %6
  br label %12, !dbg !75

12:                                               ; preds = %11, %3
  br label %13, !dbg !76

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !77, !tbaa !14
  %15 = add nsw i32 %14, 1, !dbg !77
  store i32 %15, i32* @cnt4, align 4, !dbg !77, !tbaa !14
  ret void, !dbg !78
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_021_001_main(i32 %0, i8** %1) #0 !dbg !79 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4, !tbaa !14
  store i8** %1, i8*** %5, align 8, !tbaa !80
  call void @writer1(), !dbg !82
  call void @writer2(), !dbg !83
  %6 = load i32, i32* %3, align 4, !dbg !84
  ret i32 %6, !dbg !84
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "closer_isr_1", scope: !1, file: !1, line: 949, type: !8, scopeLine: 949, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 952, column: 26, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !DILocation(line: 953, column: 22, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !11, i64 0}
!16 = !DILocation(line: 954, column: 15, scope: !7)
!17 = !DILocation(line: 956, column: 13, scope: !7)
!18 = !DILocation(line: 957, column: 18, scope: !7)
!19 = !DILocation(line: 957, column: 17, scope: !7)
!20 = !DILocation(line: 962, column: 21, scope: !7)
!21 = !DILocation(line: 962, column: 38, scope: !7)
!22 = !DILocation(line: 963, column: 34, scope: !7)
!23 = !DILocation(line: 964, column: 17, scope: !7)
!24 = !DILocation(line: 965, column: 13, scope: !7)
!25 = !DILocation(line: 966, column: 9, scope: !7)
!26 = !DILocation(line: 969, column: 13, scope: !7)
!27 = !DILocation(line: 969, column: 26, scope: !7)
!28 = !DILocation(line: 971, column: 9, scope: !7)
!29 = !DILocation(line: 975, column: 22, scope: !7)
!30 = !DILocation(line: 977, column: 13, scope: !7)
!31 = !DILocation(line: 980, column: 1, scope: !7)
!32 = distinct !DISubprogram(name: "closer_isr_2", scope: !1, file: !1, line: 982, type: !8, scopeLine: 982, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 985, column: 26, scope: !32)
!34 = !DILocation(line: 986, column: 22, scope: !32)
!35 = !DILocation(line: 987, column: 15, scope: !32)
!36 = !DILocation(line: 989, column: 13, scope: !32)
!37 = !DILocation(line: 990, column: 18, scope: !32)
!38 = !DILocation(line: 990, column: 17, scope: !32)
!39 = !DILocation(line: 995, column: 21, scope: !32)
!40 = !DILocation(line: 995, column: 38, scope: !32)
!41 = !DILocation(line: 996, column: 34, scope: !32)
!42 = !DILocation(line: 997, column: 17, scope: !32)
!43 = !DILocation(line: 998, column: 13, scope: !32)
!44 = !DILocation(line: 999, column: 9, scope: !32)
!45 = !DILocation(line: 1002, column: 13, scope: !32)
!46 = !DILocation(line: 1002, column: 26, scope: !32)
!47 = !DILocation(line: 1004, column: 9, scope: !32)
!48 = !DILocation(line: 1008, column: 22, scope: !32)
!49 = !DILocation(line: 1010, column: 13, scope: !32)
!50 = !DILocation(line: 1013, column: 1, scope: !32)
!51 = distinct !DISubprogram(name: "writer1", scope: !1, file: !1, line: 1015, type: !8, scopeLine: 1015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 1022, column: 15, scope: !51)
!53 = !DILocation(line: 1023, column: 22, scope: !51)
!54 = !DILocation(line: 1025, column: 13, scope: !51)
!55 = !DILocation(line: 1026, column: 18, scope: !51)
!56 = !DILocation(line: 1026, column: 17, scope: !51)
!57 = !DILocation(line: 1031, column: 21, scope: !51)
!58 = !DILocation(line: 1031, column: 38, scope: !51)
!59 = !DILocation(line: 1032, column: 34, scope: !51)
!60 = !DILocation(line: 1033, column: 17, scope: !51)
!61 = !DILocation(line: 1034, column: 13, scope: !51)
!62 = !DILocation(line: 1035, column: 9, scope: !51)
!63 = !DILocation(line: 1036, column: 13, scope: !51)
!64 = !DILocation(line: 1039, column: 1, scope: !51)
!65 = distinct !DISubprogram(name: "writer2", scope: !1, file: !1, line: 1041, type: !8, scopeLine: 1041, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 1044, column: 15, scope: !65)
!67 = !DILocation(line: 1045, column: 22, scope: !65)
!68 = !DILocation(line: 1047, column: 13, scope: !65)
!69 = !DILocation(line: 1048, column: 18, scope: !65)
!70 = !DILocation(line: 1048, column: 17, scope: !65)
!71 = !DILocation(line: 1053, column: 21, scope: !65)
!72 = !DILocation(line: 1053, column: 38, scope: !65)
!73 = !DILocation(line: 1054, column: 34, scope: !65)
!74 = !DILocation(line: 1055, column: 17, scope: !65)
!75 = !DILocation(line: 1056, column: 13, scope: !65)
!76 = !DILocation(line: 1057, column: 9, scope: !65)
!77 = !DILocation(line: 1058, column: 13, scope: !65)
!78 = !DILocation(line: 1061, column: 1, scope: !65)
!79 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !1, file: !1, line: 1065, type: !8, scopeLine: 1065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !{!81, !81, i64 0}
!81 = !{!"any pointer", !11, i64 0}
!82 = !DILocation(line: 1071, column: 5, scope: !79)
!83 = !DILocation(line: 1073, column: 5, scope: !79)
!84 = !DILocation(line: 1113, column: 1, scope: !79)
