; ModuleID = 'i8xx_tco_1-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@heartbeat = global i32 30, align 4
@nowayout = global i32 0, align 4
@tco_lock = common global i8 0, align 1
@tco_write_buf = common global i8 0, align 1
@tco_expect_close = common global i8 0, align 1
@tco1_rld = common global i8 0, align 1
@timer_alive = common global i64 0, align 8
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@ACPIBASE = common global i32 0, align 4
@tco1_cnt_b0 = common global i8 0, align 1
@tco1_cnt_b1 = common global i8 0, align 1
@tco1_cnt_b2 = common global i8 0, align 1
@tco1_cnt_b3 = common global i8 0, align 1
@tco1_cnt_b4 = common global i8 0, align 1
@tco1_cnt_b5 = common global i8 0, align 1
@tco1_cnt_b6 = common global i8 0, align 1
@tco1_cnt_b7 = common global i8 0, align 1

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
define void @task_isr_3() #0 !dbg !46 {
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
  br label %16, !dbg !54, !llvm.loop !55

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !54, !tbaa !48
  %18 = sext i8 %17 to i32, !dbg !54
  %19 = icmp ne i32 %18, 42, !dbg !54
  br i1 %19, label %20, label %21, !dbg !54

20:                                               ; preds = %16
  br label %22, !dbg !54

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !54, !llvm.loop !56

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !54, !tbaa !57
  br label %24, !dbg !54

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !54, !tbaa !48
  br label %25, !dbg !54

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt1, align 4, !dbg !59, !tbaa !41
  %27 = add nsw i32 %26, 1, !dbg !59
  store i32 %27, i32* @cnt1, align 4, !dbg !59, !tbaa !41
  ret void, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #0 !dbg !61 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !62, !tbaa !48
  br label %1, !dbg !63, !llvm.loop !64

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !63, !tbaa !41
  %3 = icmp ne i32 %2, 0, !dbg !63
  br i1 %3, label %10, label %4, !dbg !63

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !63, !tbaa !48
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !63, !tbaa !48
  %6 = sext i8 %5 to i32, !dbg !63
  %7 = icmp eq i32 %6, 86, !dbg !63
  br i1 %7, label %8, label %9, !dbg !63

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !63, !tbaa !48
  br label %9, !dbg !63

9:                                                ; preds = %8, %4
  br label %10, !dbg !63

10:                                               ; preds = %9, %1
  br label %11, !dbg !63, !llvm.loop !65

11:                                               ; preds = %10
  br label %12, !dbg !63, !llvm.loop !66

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !63, !tbaa !48
  br label %13, !dbg !63

13:                                               ; preds = %12
  br label %14, !dbg !63

14:                                               ; preds = %13
  br label %15, !dbg !63

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !67, !tbaa !48
  br label %16, !dbg !68, !llvm.loop !69

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !68, !tbaa !48
  %18 = sext i8 %17 to i32, !dbg !68
  %19 = icmp ne i32 %18, 42, !dbg !68
  br i1 %19, label %20, label %21, !dbg !68

20:                                               ; preds = %16
  br label %22, !dbg !68

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !68, !llvm.loop !70

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !68, !tbaa !57
  br label %24, !dbg !68

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !68, !tbaa !48
  br label %25, !dbg !68

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt2, align 4, !dbg !71, !tbaa !41
  %27 = add nsw i32 %26, 1, !dbg !71
  store i32 %27, i32* @cnt2, align 4, !dbg !71, !tbaa !41
  ret void, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #0 !dbg !73 {
  br label %1, !dbg !74, !llvm.loop !75

1:                                                ; preds = %0
  br label %2, !dbg !74, !llvm.loop !76

2:                                                ; preds = %1
  br label %3, !dbg !74, !llvm.loop !77

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !74, !tbaa !48
  br label %4, !dbg !74

4:                                                ; preds = %3
  br label %5, !dbg !74

5:                                                ; preds = %4
  br label %6, !dbg !74

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt3, align 4, !dbg !78, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !78
  store i32 %8, i32* @cnt3, align 4, !dbg !78, !tbaa !41
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_010_001_main(i32 %0, i8** %1) #0 !dbg !80 {
  store i8 0, i8* @tco_expect_close, align 1, !dbg !81, !tbaa !48
  ret i32 undef, !dbg !82
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco")
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
!46 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 716, type: !8, scopeLine: 716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 718, column: 23, scope: !46)
!48 = !{!28, !28, i64 0}
!49 = !DILocation(line: 719, column: 9, scope: !46)
!50 = distinct !{!50, !49, !49}
!51 = distinct !{!51, !49, !49}
!52 = distinct !{!52, !49, !49}
!53 = !DILocation(line: 720, column: 26, scope: !46)
!54 = !DILocation(line: 721, column: 9, scope: !46)
!55 = distinct !{!55, !54, !54}
!56 = distinct !{!56, !54, !54}
!57 = !{!58, !58, i64 0}
!58 = !{!"long", !28, i64 0}
!59 = !DILocation(line: 722, column: 13, scope: !46)
!60 = !DILocation(line: 725, column: 1, scope: !46)
!61 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 727, type: !8, scopeLine: 727, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 729, column: 23, scope: !61)
!63 = !DILocation(line: 730, column: 9, scope: !61)
!64 = distinct !{!64, !63, !63}
!65 = distinct !{!65, !63, !63}
!66 = distinct !{!66, !63, !63}
!67 = !DILocation(line: 731, column: 26, scope: !61)
!68 = !DILocation(line: 732, column: 9, scope: !61)
!69 = distinct !{!69, !68, !68}
!70 = distinct !{!70, !68, !68}
!71 = !DILocation(line: 733, column: 13, scope: !61)
!72 = !DILocation(line: 736, column: 1, scope: !61)
!73 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 738, type: !8, scopeLine: 738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 744, column: 9, scope: !73)
!75 = distinct !{!75, !74, !74}
!76 = distinct !{!76, !74, !74}
!77 = distinct !{!77, !74, !74}
!78 = !DILocation(line: 745, column: 13, scope: !73)
!79 = !DILocation(line: 748, column: 1, scope: !73)
!80 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !1, file: !1, line: 751, type: !8, scopeLine: 751, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 753, column: 20, scope: !80)
!82 = !DILocation(line: 767, column: 1, scope: !80)
