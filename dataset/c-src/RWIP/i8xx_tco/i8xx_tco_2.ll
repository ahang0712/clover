; ModuleID = 'i8xx_tco_2.bc'
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
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !9
  %3 = load i32, i32* %2, align 4, !dbg !13, !tbaa !9
  %4 = mul nsw i32 %3, 10, !dbg !14
  %5 = sdiv i32 %4, 6, !dbg !15
  %6 = trunc i32 %5 to i8, !dbg !16
  ret i8 %6, !dbg !17
}

; Function Attrs: nounwind uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #0 !dbg !18 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32
  store i32 %0, i32* %3, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %4) #2, !dbg !19
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #2, !dbg !20
  %7 = load i32, i32* %3, align 4, !dbg !21, !tbaa !9
  %8 = call zeroext i8 @seconds_to_ticks(i32 %7), !dbg !22
  store i8 %8, i8* %5, align 1, !dbg !23, !tbaa !24
  %9 = load i8, i8* %5, align 1, !dbg !25, !tbaa !24
  %10 = zext i8 %9 to i32, !dbg !25
  %11 = icmp sgt i32 %10, 63, !dbg !26
  br i1 %11, label %16, label %12, !dbg !27

12:                                               ; preds = %1
  %13 = load i8, i8* %5, align 1, !dbg !28, !tbaa !24
  %14 = zext i8 %13 to i32, !dbg !28
  %15 = icmp slt i32 %14, 4, !dbg !29
  br i1 %15, label %16, label %17, !dbg !25

16:                                               ; preds = %12, %1
  store i32 -22, i32* %2, align 4, !dbg !30
  store i32 1, i32* %6, align 4
  br label %48, !dbg !30

17:                                               ; preds = %12
  br label %18, !dbg !31, !llvm.loop !32

18:                                               ; preds = %17
  br label %19, !dbg !31

19:                                               ; preds = %22, %18
  %20 = load i8, i8* @tco_lock, align 1, !dbg !31, !tbaa !33, !range !35
  %21 = trunc i8 %20 to i1, !dbg !31
  br i1 %21, label %22, label %23, !dbg !31

22:                                               ; preds = %19
  br label %19, !dbg !31, !llvm.loop !36

23:                                               ; preds = %19
  br label %24, !dbg !31

24:                                               ; preds = %23
  br label %25, !dbg !31

25:                                               ; preds = %24
  store i8 0, i8* %4, align 1, !dbg !37, !tbaa !24
  %26 = load i8, i8* %4, align 1, !dbg !38, !tbaa !24
  %27 = zext i8 %26 to i32, !dbg !38
  %28 = and i32 %27, 192, !dbg !38
  %29 = trunc i32 %28 to i8, !dbg !38
  store i8 %29, i8* %4, align 1, !dbg !38, !tbaa !24
  %30 = load i8, i8* %5, align 1, !dbg !39, !tbaa !24
  %31 = zext i8 %30 to i32, !dbg !39
  %32 = load i8, i8* %4, align 1, !dbg !40, !tbaa !24
  %33 = zext i8 %32 to i32, !dbg !40
  %34 = or i32 %33, %31, !dbg !40
  %35 = trunc i32 %34 to i8, !dbg !40
  store i8 %35, i8* %4, align 1, !dbg !40, !tbaa !24
  store i8 0, i8* %4, align 1, !dbg !41, !tbaa !24
  br label %36, !dbg !42, !llvm.loop !43

36:                                               ; preds = %25
  store i8 0, i8* @tco_lock, align 1, !dbg !42, !tbaa !33
  br label %37, !dbg !42

37:                                               ; preds = %36
  br label %38, !dbg !42

38:                                               ; preds = %37
  %39 = load i8, i8* %4, align 1, !dbg !44, !tbaa !24
  %40 = zext i8 %39 to i32, !dbg !44
  %41 = and i32 %40, 63, !dbg !45
  %42 = load i8, i8* %5, align 1, !dbg !46, !tbaa !24
  %43 = zext i8 %42 to i32, !dbg !46
  %44 = icmp ne i32 %41, %43, !dbg !47
  br i1 %44, label %45, label %46, !dbg !48

45:                                               ; preds = %38
  store i32 -22, i32* %2, align 4, !dbg !49
  store i32 1, i32* %6, align 4
  br label %48, !dbg !49

46:                                               ; preds = %38
  %47 = load i32, i32* %3, align 4, !dbg !50, !tbaa !9
  store i32 %47, i32* @heartbeat, align 4, !dbg !51, !tbaa !9
  store i32 0, i32* %2, align 4, !dbg !52
  store i32 1, i32* %6, align 4
  br label %48, !dbg !52

48:                                               ; preds = %46, %45, %16
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #2, !dbg !53
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %4) #2, !dbg !53
  %49 = load i32, i32* %2, align 4, !dbg !53
  ret i32 %49, !dbg !53
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define internal i32 @tco_timer_get_timeleft(i32* %0) #0 !dbg !54 {
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  store i32* %0, i32** %2, align 8, !tbaa !55
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #2, !dbg !57
  br label %4, !dbg !58, !llvm.loop !59

4:                                                ; preds = %1
  br label %5, !dbg !58

5:                                                ; preds = %8, %4
  %6 = load i8, i8* @tco_lock, align 1, !dbg !58, !tbaa !33, !range !35
  %7 = trunc i8 %6 to i1, !dbg !58
  br i1 %7, label %8, label %9, !dbg !58

8:                                                ; preds = %5
  br label %5, !dbg !58, !llvm.loop !60

9:                                                ; preds = %5
  br label %10, !dbg !58

10:                                               ; preds = %9
  br label %11, !dbg !58

11:                                               ; preds = %10
  store i8 0, i8* %3, align 1, !dbg !61, !tbaa !24
  %12 = load i8, i8* %3, align 1, !dbg !62, !tbaa !24
  %13 = zext i8 %12 to i32, !dbg !62
  %14 = and i32 %13, 63, !dbg !62
  %15 = trunc i32 %14 to i8, !dbg !62
  store i8 %15, i8* %3, align 1, !dbg !62, !tbaa !24
  br label %16, !dbg !63, !llvm.loop !64

16:                                               ; preds = %11
  store i8 0, i8* @tco_lock, align 1, !dbg !63, !tbaa !33
  br label %17, !dbg !63

17:                                               ; preds = %16
  br label %18, !dbg !63

18:                                               ; preds = %17
  %19 = load i8, i8* %3, align 1, !dbg !65, !tbaa !24
  %20 = zext i8 %19 to i32, !dbg !65
  %21 = mul nsw i32 %20, 6, !dbg !66
  %22 = sdiv i32 %21, 10, !dbg !67
  %23 = load i32*, i32** %2, align 8, !dbg !68, !tbaa !55
  store i32 %22, i32* %23, align 4, !dbg !69, !tbaa !9
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #2, !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @closer1() #0 !dbg !72 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !73, !tbaa !24
  br label %1, !dbg !74, !llvm.loop !75

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !74, !tbaa !9
  %3 = icmp ne i32 %2, 0, !dbg !74
  br i1 %3, label %10, label %4, !dbg !74

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !74, !tbaa !24
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !74, !tbaa !24
  %6 = sext i8 %5 to i32, !dbg !74
  %7 = icmp eq i32 %6, 86, !dbg !74
  br i1 %7, label %8, label %9, !dbg !74

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !74, !tbaa !24
  br label %9, !dbg !74

9:                                                ; preds = %8, %4
  br label %10, !dbg !74

10:                                               ; preds = %9, %1
  br label %11, !dbg !74, !llvm.loop !76

11:                                               ; preds = %10
  br label %12, !dbg !74, !llvm.loop !77

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !74, !tbaa !24
  br label %13, !dbg !74

13:                                               ; preds = %12
  br label %14, !dbg !74

14:                                               ; preds = %13
  br label %15, !dbg !74

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !78, !tbaa !24
  %16 = load i32, i32* @cnt1, align 4, !dbg !79, !tbaa !9
  %17 = add nsw i32 %16, 1, !dbg !79
  store i32 %17, i32* @cnt1, align 4, !dbg !79, !tbaa !9
  ret void, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #0 !dbg !81 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !82, !tbaa !24
  br label %1, !dbg !83, !llvm.loop !84

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !83, !tbaa !9
  %3 = icmp ne i32 %2, 0, !dbg !83
  br i1 %3, label %10, label %4, !dbg !83

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !83, !tbaa !24
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !83, !tbaa !24
  %6 = sext i8 %5 to i32, !dbg !83
  %7 = icmp eq i32 %6, 86, !dbg !83
  br i1 %7, label %8, label %9, !dbg !83

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !83, !tbaa !24
  br label %9, !dbg !83

9:                                                ; preds = %8, %4
  br label %10, !dbg !83

10:                                               ; preds = %9, %1
  br label %11, !dbg !83, !llvm.loop !85

11:                                               ; preds = %10
  br label %12, !dbg !83, !llvm.loop !86

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !83, !tbaa !24
  br label %13, !dbg !83

13:                                               ; preds = %12
  br label %14, !dbg !83

14:                                               ; preds = %13
  br label %15, !dbg !83

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !87, !tbaa !24
  br label %16, !dbg !88, !llvm.loop !89

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !88, !tbaa !24
  %18 = sext i8 %17 to i32, !dbg !88
  %19 = icmp ne i32 %18, 42, !dbg !88
  br i1 %19, label %20, label %21, !dbg !88

20:                                               ; preds = %16
  br label %22, !dbg !88

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !88, !llvm.loop !90

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !88, !tbaa !91
  br label %24, !dbg !88

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !88, !tbaa !24
  br label %25, !dbg !88

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt2, align 4, !dbg !93, !tbaa !9
  %27 = add nsw i32 %26, 1, !dbg !93
  store i32 %27, i32* @cnt2, align 4, !dbg !93, !tbaa !9
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #0 !dbg !95 {
  br label %1, !dbg !96, !llvm.loop !97

1:                                                ; preds = %0
  br label %2, !dbg !96, !llvm.loop !98

2:                                                ; preds = %1
  br label %3, !dbg !96, !llvm.loop !99

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !96, !tbaa !24
  br label %4, !dbg !96

4:                                                ; preds = %3
  br label %5, !dbg !96

5:                                                ; preds = %4
  br label %6, !dbg !96

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt3, align 4, !dbg !100, !tbaa !9
  %8 = add nsw i32 %7, 1, !dbg !100
  store i32 %8, i32* @cnt3, align 4, !dbg !100, !tbaa !9
  ret void, !dbg !101
}

; Function Attrs: nounwind uwtable
define void @task_isr_3() #0 !dbg !102 {
  br label %1, !dbg !103, !llvm.loop !104

1:                                                ; preds = %0
  br label %2, !dbg !103, !llvm.loop !105

2:                                                ; preds = %1
  br label %3, !dbg !103, !llvm.loop !106

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !103, !tbaa !24
  br label %4, !dbg !103

4:                                                ; preds = %3
  br label %5, !dbg !103

5:                                                ; preds = %4
  br label %6, !dbg !103

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !107, !tbaa !9
  %8 = add nsw i32 %7, 1, !dbg !107
  store i32 %8, i32* @cnt4, align 4, !dbg !107, !tbaa !9
  ret void, !dbg !108
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_011_001_main(i32 %0, i8** %1) #0 !dbg !109 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4, !tbaa !9
  store i8** %1, i8*** %5, align 8, !tbaa !55
  store i8 0, i8* @tco_expect_close, align 1, !dbg !110, !tbaa !24
  call void @closer1(), !dbg !111
  %6 = load i32, i32* %3, align 4, !dbg !112
  ret i32 %6, !dbg !112
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

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
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !DILocation(line: 181, column: 10, scope: !7)
!14 = !DILocation(line: 181, column: 18, scope: !7)
!15 = !DILocation(line: 181, column: 24, scope: !7)
!16 = !DILocation(line: 181, column: 9, scope: !7)
!17 = !DILocation(line: 181, column: 2, scope: !7)
!18 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !1, file: !1, line: 265, type: !8, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 267, column: 2, scope: !18)
!20 = !DILocation(line: 268, column: 2, scope: !18)
!21 = !DILocation(line: 270, column: 28, scope: !18)
!22 = !DILocation(line: 270, column: 11, scope: !18)
!23 = !DILocation(line: 270, column: 9, scope: !18)
!24 = !{!11, !11, i64 0}
!25 = !DILocation(line: 273, column: 6, scope: !18)
!26 = !DILocation(line: 273, column: 13, scope: !18)
!27 = !DILocation(line: 273, column: 20, scope: !18)
!28 = !DILocation(line: 273, column: 23, scope: !18)
!29 = !DILocation(line: 273, column: 30, scope: !18)
!30 = !DILocation(line: 274, column: 3, scope: !18)
!31 = !DILocation(line: 277, column: 2, scope: !18)
!32 = distinct !{!32, !31, !31}
!33 = !{!34, !34, i64 0}
!34 = !{!"_Bool", !11, i64 0}
!35 = !{i8 0, i8 2}
!36 = distinct !{!36, !31, !31}
!37 = !DILocation(line: 278, column: 6, scope: !18)
!38 = !DILocation(line: 279, column: 6, scope: !18)
!39 = !DILocation(line: 280, column: 9, scope: !18)
!40 = !DILocation(line: 280, column: 6, scope: !18)
!41 = !DILocation(line: 283, column: 6, scope: !18)
!42 = !DILocation(line: 284, column: 2, scope: !18)
!43 = distinct !{!43, !42, !42}
!44 = !DILocation(line: 286, column: 7, scope: !18)
!45 = !DILocation(line: 286, column: 11, scope: !18)
!46 = !DILocation(line: 286, column: 22, scope: !18)
!47 = !DILocation(line: 286, column: 19, scope: !18)
!48 = !DILocation(line: 286, column: 6, scope: !18)
!49 = !DILocation(line: 287, column: 3, scope: !18)
!50 = !DILocation(line: 289, column: 14, scope: !18)
!51 = !DILocation(line: 289, column: 12, scope: !18)
!52 = !DILocation(line: 290, column: 2, scope: !18)
!53 = !DILocation(line: 291, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "tco_timer_get_timeleft", scope: !1, file: !1, line: 293, type: !8, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!55 = !{!56, !56, i64 0}
!56 = !{!"any pointer", !11, i64 0}
!57 = !DILocation(line: 295, column: 2, scope: !54)
!58 = !DILocation(line: 297, column: 2, scope: !54)
!59 = distinct !{!59, !58, !58}
!60 = distinct !{!60, !58, !58}
!61 = !DILocation(line: 300, column: 6, scope: !54)
!62 = !DILocation(line: 301, column: 6, scope: !54)
!63 = !DILocation(line: 303, column: 2, scope: !54)
!64 = distinct !{!64, !63, !63}
!65 = !DILocation(line: 305, column: 22, scope: !54)
!66 = !DILocation(line: 305, column: 26, scope: !54)
!67 = !DILocation(line: 305, column: 31, scope: !54)
!68 = !DILocation(line: 305, column: 3, scope: !54)
!69 = !DILocation(line: 305, column: 13, scope: !54)
!70 = !DILocation(line: 308, column: 1, scope: !54)
!71 = !DILocation(line: 307, column: 2, scope: !54)
!72 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 718, type: !8, scopeLine: 718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 725, column: 23, scope: !72)
!74 = !DILocation(line: 726, column: 9, scope: !72)
!75 = distinct !{!75, !74, !74}
!76 = distinct !{!76, !74, !74}
!77 = distinct !{!77, !74, !74}
!78 = !DILocation(line: 727, column: 26, scope: !72)
!79 = !DILocation(line: 729, column: 13, scope: !72)
!80 = !DILocation(line: 732, column: 1, scope: !72)
!81 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 733, type: !8, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 735, column: 23, scope: !81)
!83 = !DILocation(line: 736, column: 9, scope: !81)
!84 = distinct !{!84, !83, !83}
!85 = distinct !{!85, !83, !83}
!86 = distinct !{!86, !83, !83}
!87 = !DILocation(line: 737, column: 26, scope: !81)
!88 = !DILocation(line: 738, column: 9, scope: !81)
!89 = distinct !{!89, !88, !88}
!90 = distinct !{!90, !88, !88}
!91 = !{!92, !92, i64 0}
!92 = !{!"long", !11, i64 0}
!93 = !DILocation(line: 739, column: 13, scope: !81)
!94 = !DILocation(line: 742, column: 1, scope: !81)
!95 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 744, type: !8, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 748, column: 9, scope: !95)
!97 = distinct !{!97, !96, !96}
!98 = distinct !{!98, !96, !96}
!99 = distinct !{!99, !96, !96}
!100 = !DILocation(line: 749, column: 13, scope: !95)
!101 = !DILocation(line: 752, column: 1, scope: !95)
!102 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 754, type: !8, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!103 = !DILocation(line: 756, column: 9, scope: !102)
!104 = distinct !{!104, !103, !103}
!105 = distinct !{!105, !103, !103}
!106 = distinct !{!106, !103, !103}
!107 = !DILocation(line: 757, column: 13, scope: !102)
!108 = !DILocation(line: 760, column: 1, scope: !102)
!109 = distinct !DISubprogram(name: "svp_simple_011_001_main", scope: !1, file: !1, line: 907, type: !8, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 909, column: 20, scope: !109)
!111 = !DILocation(line: 914, column: 5, scope: !109)
!112 = !DILocation(line: 942, column: 1, scope: !109)
