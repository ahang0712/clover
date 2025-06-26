; ModuleID = 'i8xx_tco_2-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@heartbeat = global i32 30, align 4
@nowayout = global i32 0, align 4
@tco_lock = common global i8 0, align 1
@tco_write_buf = common global i8 0, align 1
@tco_expect_close = common global i8 0, align 1
@tco1_rld = common global i8 0, align 1
@cnt1 = common global i32 0, align 4
@timer_alive = common global i64 0, align 8
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@ACPIBASE = common global i32 0, align 4
@tco1_cnt_b0 = common global i8 0, align 1
@tco1_cnt_b1 = common global i8 0, align 1
@tco1_cnt_b2 = common global i8 0, align 1
@tco1_cnt_b3 = common global i8 0, align 1
@tco1_cnt_b4 = common global i8 0, align 1
@tco1_cnt_b5 = common global i8 0, align 1
@tco1_cnt_b6 = common global i8 0, align 1
@tco1_cnt_b7 = common global i8 0, align 1
@cnt5 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define zeroext i8 @seconds_to_ticks(i32 %0) #0 !dbg !7 {
  %2 = mul nsw i32 %0, 10, !dbg !9
  %3 = sdiv i32 %2, 6, !dbg !10
  %4 = trunc i32 %3 to i8, !dbg !11
  ret i8 %4, !dbg !12
}

; Function Attrs: nounwind uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #0 !dbg !13 {
  %2 = mul nsw i32 %0, 10, !dbg !14
  %3 = sdiv i32 %2, 6, !dbg !16
  %4 = trunc i32 %3 to i8, !dbg !17
  %5 = zext i8 %4 to i32, !dbg !18
  %6 = icmp sgt i32 %5, 63, !dbg !19
  br i1 %6, label %10, label %7, !dbg !20

7:                                                ; preds = %1
  %8 = zext i8 %4 to i32, !dbg !21
  %9 = icmp slt i32 %8, 4, !dbg !22
  br i1 %9, label %10, label %11, !dbg !18

10:                                               ; preds = %7, %1
  br label %30, !dbg !23

11:                                               ; preds = %7
  br label %12, !dbg !24, !llvm.loop !25

12:                                               ; preds = %11
  br label %13, !dbg !24

13:                                               ; preds = %16, %12
  %14 = load i8, i8* @tco_lock, align 1, !dbg !24, !tbaa !26, !range !30
  %15 = trunc i8 %14 to i1, !dbg !24
  br i1 %15, label %16, label %17, !dbg !24

16:                                               ; preds = %13
  br label %13, !dbg !24, !llvm.loop !31

17:                                               ; preds = %13
  br label %18, !dbg !24

18:                                               ; preds = %17
  br label %19, !dbg !24

19:                                               ; preds = %18
  %20 = zext i8 %4 to i32, !dbg !32
  %21 = or i32 0, %20, !dbg !33
  %22 = trunc i32 %21 to i8, !dbg !33
  br label %23, !dbg !34, !llvm.loop !35

23:                                               ; preds = %19
  store i8 0, i8* @tco_lock, align 1, !dbg !34, !tbaa !26
  br label %24, !dbg !34

24:                                               ; preds = %23
  br label %25, !dbg !34

25:                                               ; preds = %24
  %26 = zext i8 %4 to i32, !dbg !36
  %27 = icmp ne i32 0, %26, !dbg !37
  br i1 %27, label %28, label %29, !dbg !38

28:                                               ; preds = %25
  br label %30, !dbg !39

29:                                               ; preds = %25
  store i32 %0, i32* @heartbeat, align 4, !dbg !40, !tbaa !41
  br label %30, !dbg !43

30:                                               ; preds = %29, %28, %10
  %.0 = phi i32 [ -22, %10 ], [ -22, %28 ], [ 0, %29 ], !dbg !44
  ret i32 %.0, !dbg !45
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @closer1() #0 !dbg !46 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !47, !tbaa !48
  br label %1, !dbg !49, !llvm.loop !50

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !49, !tbaa !41
  %3 = icmp ne i32 %2, 0, !dbg !49
  br i1 %3, label %10, label %4, !dbg !49

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !49, !tbaa !48
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !49, !tbaa !48
  %6 = sext i8 %5 to i32, !dbg !49
  %7 = icmp eq i32 %6, 86, !dbg !49
  br i1 %7, label %8, label %9, !dbg !49

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !49, !tbaa !48
  br label %9, !dbg !49

9:                                                ; preds = %8, %4
  br label %10, !dbg !49

10:                                               ; preds = %9, %1
  br label %11, !dbg !49, !llvm.loop !51

11:                                               ; preds = %10
  br label %12, !dbg !49, !llvm.loop !52

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !49, !tbaa !48
  br label %13, !dbg !49

13:                                               ; preds = %12
  br label %14, !dbg !49

14:                                               ; preds = %13
  br label %15, !dbg !49

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !53, !tbaa !48
  %16 = load i32, i32* @cnt1, align 4, !dbg !54, !tbaa !41
  %17 = add nsw i32 %16, 1, !dbg !54
  store i32 %17, i32* @cnt1, align 4, !dbg !54, !tbaa !41
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #0 !dbg !56 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !57, !tbaa !48
  br label %1, !dbg !58, !llvm.loop !59

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !58, !tbaa !41
  %3 = icmp ne i32 %2, 0, !dbg !58
  br i1 %3, label %10, label %4, !dbg !58

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !58, !tbaa !48
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !58, !tbaa !48
  %6 = sext i8 %5 to i32, !dbg !58
  %7 = icmp eq i32 %6, 86, !dbg !58
  br i1 %7, label %8, label %9, !dbg !58

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !58, !tbaa !48
  br label %9, !dbg !58

9:                                                ; preds = %8, %4
  br label %10, !dbg !58

10:                                               ; preds = %9, %1
  br label %11, !dbg !58, !llvm.loop !60

11:                                               ; preds = %10
  br label %12, !dbg !58, !llvm.loop !61

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !58, !tbaa !48
  br label %13, !dbg !58

13:                                               ; preds = %12
  br label %14, !dbg !58

14:                                               ; preds = %13
  br label %15, !dbg !58

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !62, !tbaa !48
  br label %16, !dbg !63, !llvm.loop !64

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !63, !tbaa !48
  %18 = sext i8 %17 to i32, !dbg !63
  %19 = icmp ne i32 %18, 42, !dbg !63
  br i1 %19, label %20, label %21, !dbg !63

20:                                               ; preds = %16
  br label %22, !dbg !63

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !63, !llvm.loop !65

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !63, !tbaa !66
  br label %24, !dbg !63

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !63, !tbaa !48
  br label %25, !dbg !63

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt2, align 4, !dbg !68, !tbaa !41
  %27 = add nsw i32 %26, 1, !dbg !68
  store i32 %27, i32* @cnt2, align 4, !dbg !68, !tbaa !41
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #0 !dbg !70 {
  br label %1, !dbg !71, !llvm.loop !72

1:                                                ; preds = %0
  br label %2, !dbg !71, !llvm.loop !73

2:                                                ; preds = %1
  br label %3, !dbg !71, !llvm.loop !74

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !71, !tbaa !48
  br label %4, !dbg !71

4:                                                ; preds = %3
  br label %5, !dbg !71

5:                                                ; preds = %4
  br label %6, !dbg !71

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt3, align 4, !dbg !75, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !75
  store i32 %8, i32* @cnt3, align 4, !dbg !75, !tbaa !41
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @task_isr_3() #0 !dbg !77 {
  br label %1, !dbg !78, !llvm.loop !79

1:                                                ; preds = %0
  br label %2, !dbg !78, !llvm.loop !80

2:                                                ; preds = %1
  br label %3, !dbg !78, !llvm.loop !81

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !78, !tbaa !48
  br label %4, !dbg !78

4:                                                ; preds = %3
  br label %5, !dbg !78

5:                                                ; preds = %4
  br label %6, !dbg !78

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !82, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !82
  store i32 %8, i32* @cnt4, align 4, !dbg !82, !tbaa !41
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_011_001_main(i32 %0, i8** %1) #0 !dbg !84 {
  store i8 0, i8* @tco_expect_close, align 1, !dbg !85, !tbaa !48
  store i8 86, i8* @tco_write_buf, align 1, !dbg !86, !tbaa !48
  %3 = load i32, i32* @nowayout, align 4, !dbg !88, !tbaa !41
  %4 = icmp ne i32 %3, 0, !dbg !88
  br i1 %4, label %closer1.exit, label %5, !dbg !88

5:                                                ; preds = %2
  store i8 0, i8* @tco_expect_close, align 1, !dbg !88, !tbaa !48
  %6 = load i8, i8* @tco_write_buf, align 1, !dbg !88, !tbaa !48
  %7 = sext i8 %6 to i32, !dbg !88
  %8 = icmp eq i32 %7, 86, !dbg !88
  br i1 %8, label %9, label %10, !dbg !88

9:                                                ; preds = %5
  store i8 42, i8* @tco_expect_close, align 1, !dbg !88, !tbaa !48
  br label %10, !dbg !88

10:                                               ; preds = %9, %5
  br label %closer1.exit, !dbg !88

closer1.exit:                                     ; preds = %2, %10
  store i8 1, i8* @tco1_rld, align 1, !dbg !88, !tbaa !48
  store i8 42, i8* @tco_expect_close, align 1, !dbg !89, !tbaa !48
  %11 = load i32, i32* @cnt1, align 4, !dbg !90, !tbaa !41
  %12 = add nsw i32 %11, 1, !dbg !90
  store i32 %12, i32* @cnt1, align 4, !dbg !90, !tbaa !41
  ret i32 undef, !dbg !91
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "seconds_to_ticks", scope: !1, file: !1, line: 177, type: !8, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 181, column: 18, scope: !7)
!10 = !DILocation(line: 181, column: 24, scope: !7)
!11 = !DILocation(line: 181, column: 9, scope: !7)
!12 = !DILocation(line: 181, column: 2, scope: !7)
!13 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !1, file: !1, line: 265, type: !8, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = !DILocation(line: 181, column: 18, scope: !7, inlinedAt: !15)
!15 = distinct !DILocation(line: 270, column: 11, scope: !13)
!16 = !DILocation(line: 181, column: 24, scope: !7, inlinedAt: !15)
!17 = !DILocation(line: 181, column: 9, scope: !7, inlinedAt: !15)
!18 = !DILocation(line: 273, column: 6, scope: !13)
!19 = !DILocation(line: 273, column: 13, scope: !13)
!20 = !DILocation(line: 273, column: 20, scope: !13)
!21 = !DILocation(line: 273, column: 23, scope: !13)
!22 = !DILocation(line: 273, column: 30, scope: !13)
!23 = !DILocation(line: 274, column: 3, scope: !13)
!24 = !DILocation(line: 277, column: 2, scope: !13)
!25 = distinct !{!25, !24, !24}
!26 = !{!27, !27, i64 0}
!27 = !{!"_Bool", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C/C++ TBAA"}
!30 = !{i8 0, i8 2}
!31 = distinct !{!31, !24, !24}
!32 = !DILocation(line: 280, column: 9, scope: !13)
!33 = !DILocation(line: 280, column: 6, scope: !13)
!34 = !DILocation(line: 284, column: 2, scope: !13)
!35 = distinct !{!35, !34, !34}
!36 = !DILocation(line: 286, column: 22, scope: !13)
!37 = !DILocation(line: 286, column: 19, scope: !13)
!38 = !DILocation(line: 286, column: 6, scope: !13)
!39 = !DILocation(line: 287, column: 3, scope: !13)
!40 = !DILocation(line: 289, column: 12, scope: !13)
!41 = !{!42, !42, i64 0}
!42 = !{!"int", !28, i64 0}
!43 = !DILocation(line: 290, column: 2, scope: !13)
!44 = !DILocation(line: 0, scope: !13)
!45 = !DILocation(line: 291, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 718, type: !8, scopeLine: 718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 725, column: 23, scope: !46)
!48 = !{!28, !28, i64 0}
!49 = !DILocation(line: 726, column: 9, scope: !46)
!50 = distinct !{!50, !49, !49}
!51 = distinct !{!51, !49, !49}
!52 = distinct !{!52, !49, !49}
!53 = !DILocation(line: 727, column: 26, scope: !46)
!54 = !DILocation(line: 729, column: 13, scope: !46)
!55 = !DILocation(line: 732, column: 1, scope: !46)
!56 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 733, type: !8, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 735, column: 23, scope: !56)
!58 = !DILocation(line: 736, column: 9, scope: !56)
!59 = distinct !{!59, !58, !58}
!60 = distinct !{!60, !58, !58}
!61 = distinct !{!61, !58, !58}
!62 = !DILocation(line: 737, column: 26, scope: !56)
!63 = !DILocation(line: 738, column: 9, scope: !56)
!64 = distinct !{!64, !63, !63}
!65 = distinct !{!65, !63, !63}
!66 = !{!67, !67, i64 0}
!67 = !{!"long", !28, i64 0}
!68 = !DILocation(line: 739, column: 13, scope: !56)
!69 = !DILocation(line: 742, column: 1, scope: !56)
!70 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 744, type: !8, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 748, column: 9, scope: !70)
!72 = distinct !{!72, !71, !71}
!73 = distinct !{!73, !71, !71}
!74 = distinct !{!74, !71, !71}
!75 = !DILocation(line: 749, column: 13, scope: !70)
!76 = !DILocation(line: 752, column: 1, scope: !70)
!77 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 754, type: !8, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 756, column: 9, scope: !77)
!79 = distinct !{!79, !78, !78}
!80 = distinct !{!80, !78, !78}
!81 = distinct !{!81, !78, !78}
!82 = !DILocation(line: 757, column: 13, scope: !77)
!83 = !DILocation(line: 760, column: 1, scope: !77)
!84 = distinct !DISubprogram(name: "svp_simple_011_001_main", scope: !1, file: !1, line: 907, type: !8, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 909, column: 20, scope: !84)
!86 = !DILocation(line: 725, column: 23, scope: !46, inlinedAt: !87)
!87 = distinct !DILocation(line: 914, column: 5, scope: !84)
!88 = !DILocation(line: 726, column: 9, scope: !46, inlinedAt: !87)
!89 = !DILocation(line: 727, column: 26, scope: !46, inlinedAt: !87)
!90 = !DILocation(line: 729, column: 13, scope: !46, inlinedAt: !87)
!91 = !DILocation(line: 942, column: 1, scope: !84)
