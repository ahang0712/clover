; ModuleID = 'i8xx_tco_3-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@heartbeat = global i32 30, align 4
@nowayout = global i32 0, align 4
@tco_lock = common global i8 0, align 1
@tco_write_buf = common global i8 0, align 1
@tco_expect_close = common global i8 0, align 1
@tco1_rld = common global i8 0, align 1
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@timer_alive = common global i64 0, align 8
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4
@ACPIBASE = common global i32 0, align 4
@tco1_cnt_b0 = common global i8 0, align 1
@tco1_cnt_b1 = common global i8 0, align 1
@tco1_cnt_b2 = common global i8 0, align 1
@tco1_cnt_b3 = common global i8 0, align 1
@tco1_cnt_b4 = common global i8 0, align 1
@tco1_cnt_b5 = common global i8 0, align 1
@tco1_cnt_b6 = common global i8 0, align 1
@tco1_cnt_b7 = common global i8 0, align 1
@cnt7 = common global i32 0, align 4
@cnt8 = common global i32 0, align 4

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
define void @closer2() #0 !dbg !56 {
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
  %16 = load i32, i32* @cnt2, align 4, !dbg !63, !tbaa !41
  %17 = add nsw i32 %16, 1, !dbg !63
  store i32 %17, i32* @cnt2, align 4, !dbg !63, !tbaa !41
  ret void, !dbg !64
}

; Function Attrs: nounwind uwtable
define void @closer3() #0 !dbg !65 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !66, !tbaa !48
  br label %1, !dbg !67, !llvm.loop !68

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !67, !tbaa !41
  %3 = icmp ne i32 %2, 0, !dbg !67
  br i1 %3, label %10, label %4, !dbg !67

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !67, !tbaa !48
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !67, !tbaa !48
  %6 = sext i8 %5 to i32, !dbg !67
  %7 = icmp eq i32 %6, 86, !dbg !67
  br i1 %7, label %8, label %9, !dbg !67

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !67, !tbaa !48
  br label %9, !dbg !67

9:                                                ; preds = %8, %4
  br label %10, !dbg !67

10:                                               ; preds = %9, %1
  br label %11, !dbg !67, !llvm.loop !69

11:                                               ; preds = %10
  br label %12, !dbg !67, !llvm.loop !70

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !67, !tbaa !48
  br label %13, !dbg !67

13:                                               ; preds = %12
  br label %14, !dbg !67

14:                                               ; preds = %13
  br label %15, !dbg !67

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !71, !tbaa !48
  br label %16, !dbg !72, !llvm.loop !73

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !72, !tbaa !48
  %18 = sext i8 %17 to i32, !dbg !72
  %19 = icmp ne i32 %18, 42, !dbg !72
  br i1 %19, label %20, label %21, !dbg !72

20:                                               ; preds = %16
  br label %22, !dbg !72

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !72, !llvm.loop !74

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !72, !tbaa !75
  br label %24, !dbg !72

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !72, !tbaa !48
  br label %25, !dbg !72

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt3, align 4, !dbg !77, !tbaa !41
  %27 = add nsw i32 %26, 1, !dbg !77
  store i32 %27, i32* @cnt3, align 4, !dbg !77, !tbaa !41
  ret void, !dbg !78
}

; Function Attrs: nounwind uwtable
define void @writer_isr_1() #0 !dbg !79 {
  br label %1, !dbg !80, !llvm.loop !81

1:                                                ; preds = %0
  br label %2, !dbg !80, !llvm.loop !82

2:                                                ; preds = %1
  br label %3, !dbg !80, !llvm.loop !83

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !80, !tbaa !48
  br label %4, !dbg !80

4:                                                ; preds = %3
  br label %5, !dbg !80

5:                                                ; preds = %4
  br label %6, !dbg !80

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !84, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !84
  store i32 %8, i32* @cnt4, align 4, !dbg !84, !tbaa !41
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define void @writer_isr_2() #0 !dbg !86 {
  br label %1, !dbg !87, !llvm.loop !88

1:                                                ; preds = %0
  br label %2, !dbg !87, !llvm.loop !89

2:                                                ; preds = %1
  br label %3, !dbg !87, !llvm.loop !90

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !87, !tbaa !48
  br label %4, !dbg !87

4:                                                ; preds = %3
  br label %5, !dbg !87

5:                                                ; preds = %4
  br label %6, !dbg !87

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt5, align 4, !dbg !91, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !91
  store i32 %8, i32* @cnt5, align 4, !dbg !91, !tbaa !41
  ret void, !dbg !92
}

; Function Attrs: nounwind uwtable
define void @writer_isr_3() #0 !dbg !93 {
  br label %1, !dbg !94, !llvm.loop !95

1:                                                ; preds = %0
  br label %2, !dbg !94, !llvm.loop !96

2:                                                ; preds = %1
  br label %3, !dbg !94, !llvm.loop !97

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !94, !tbaa !48
  br label %4, !dbg !94

4:                                                ; preds = %3
  br label %5, !dbg !94

5:                                                ; preds = %4
  br label %6, !dbg !94

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt6, align 4, !dbg !98, !tbaa !41
  %8 = add nsw i32 %7, 1, !dbg !98
  store i32 %8, i32* @cnt6, align 4, !dbg !98, !tbaa !41
  ret void, !dbg !99
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_012_001_main(i32 %0, i8** %1) #0 !dbg !100 {
  store i8 0, i8* @tco_expect_close, align 1, !dbg !101, !tbaa !48
  store i8 86, i8* @tco_write_buf, align 1, !dbg !102, !tbaa !48
  %3 = load i32, i32* @nowayout, align 4, !dbg !104, !tbaa !41
  %4 = icmp ne i32 %3, 0, !dbg !104
  br i1 %4, label %closer1.exit, label %5, !dbg !104

5:                                                ; preds = %2
  store i8 0, i8* @tco_expect_close, align 1, !dbg !104, !tbaa !48
  %6 = load i8, i8* @tco_write_buf, align 1, !dbg !104, !tbaa !48
  %7 = sext i8 %6 to i32, !dbg !104
  %8 = icmp eq i32 %7, 86, !dbg !104
  br i1 %8, label %9, label %10, !dbg !104

9:                                                ; preds = %5
  store i8 42, i8* @tco_expect_close, align 1, !dbg !104, !tbaa !48
  br label %10, !dbg !104

10:                                               ; preds = %9, %5
  br label %closer1.exit, !dbg !104

closer1.exit:                                     ; preds = %2, %10
  store i8 1, i8* @tco1_rld, align 1, !dbg !104, !tbaa !48
  store i8 42, i8* @tco_expect_close, align 1, !dbg !105, !tbaa !48
  %11 = load i32, i32* @cnt1, align 4, !dbg !106, !tbaa !41
  %12 = add nsw i32 %11, 1, !dbg !106
  store i32 %12, i32* @cnt1, align 4, !dbg !106, !tbaa !41
  store i8 86, i8* @tco_write_buf, align 1, !dbg !107, !tbaa !48
  %13 = load i32, i32* @nowayout, align 4, !dbg !109, !tbaa !41
  %14 = icmp ne i32 %13, 0, !dbg !109
  br i1 %14, label %closer2.exit, label %15, !dbg !109

15:                                               ; preds = %closer1.exit
  store i8 0, i8* @tco_expect_close, align 1, !dbg !109, !tbaa !48
  %16 = load i8, i8* @tco_write_buf, align 1, !dbg !109, !tbaa !48
  %17 = sext i8 %16 to i32, !dbg !109
  %18 = icmp eq i32 %17, 86, !dbg !109
  br i1 %18, label %19, label %20, !dbg !109

19:                                               ; preds = %15
  store i8 42, i8* @tco_expect_close, align 1, !dbg !109, !tbaa !48
  br label %20, !dbg !109

20:                                               ; preds = %19, %15
  br label %closer2.exit, !dbg !109

closer2.exit:                                     ; preds = %closer1.exit, %20
  store i8 1, i8* @tco1_rld, align 1, !dbg !109, !tbaa !48
  store i8 42, i8* @tco_expect_close, align 1, !dbg !110, !tbaa !48
  %21 = load i32, i32* @cnt2, align 4, !dbg !111, !tbaa !41
  %22 = add nsw i32 %21, 1, !dbg !111
  store i32 %22, i32* @cnt2, align 4, !dbg !111, !tbaa !41
  store i8 86, i8* @tco_write_buf, align 1, !dbg !112, !tbaa !48
  %23 = load i32, i32* @nowayout, align 4, !dbg !114, !tbaa !41
  %24 = icmp ne i32 %23, 0, !dbg !114
  br i1 %24, label %31, label %25, !dbg !114

25:                                               ; preds = %closer2.exit
  store i8 0, i8* @tco_expect_close, align 1, !dbg !114, !tbaa !48
  %26 = load i8, i8* @tco_write_buf, align 1, !dbg !114, !tbaa !48
  %27 = sext i8 %26 to i32, !dbg !114
  %28 = icmp eq i32 %27, 86, !dbg !114
  br i1 %28, label %29, label %30, !dbg !114

29:                                               ; preds = %25
  store i8 42, i8* @tco_expect_close, align 1, !dbg !114, !tbaa !48
  br label %30, !dbg !114

30:                                               ; preds = %29, %25
  br label %31, !dbg !114

31:                                               ; preds = %30, %closer2.exit
  store i8 1, i8* @tco1_rld, align 1, !dbg !114, !tbaa !48
  store i8 42, i8* @tco_expect_close, align 1, !dbg !115, !tbaa !48
  %32 = load i8, i8* @tco_expect_close, align 1, !dbg !116, !tbaa !48
  %33 = sext i8 %32 to i32, !dbg !116
  %34 = icmp ne i32 %33, 42, !dbg !116
  br i1 %34, label %35, label %36, !dbg !116

35:                                               ; preds = %31
  br label %closer3.exit, !dbg !116

36:                                               ; preds = %31
  br label %closer3.exit

closer3.exit:                                     ; preds = %35, %36
  store i64 0, i64* @timer_alive, align 8, !dbg !116, !tbaa !75
  store i8 0, i8* @tco_expect_close, align 1, !dbg !116, !tbaa !48
  %37 = load i32, i32* @cnt3, align 4, !dbg !117, !tbaa !41
  %38 = add nsw i32 %37, 1, !dbg !117
  store i32 %38, i32* @cnt3, align 4, !dbg !117, !tbaa !41
  ret i32 undef, !dbg !118
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_3.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco")
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
!46 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 719, type: !8, scopeLine: 719, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 723, column: 23, scope: !46)
!48 = !{!28, !28, i64 0}
!49 = !DILocation(line: 724, column: 9, scope: !46)
!50 = distinct !{!50, !49, !49}
!51 = distinct !{!51, !49, !49}
!52 = distinct !{!52, !49, !49}
!53 = !DILocation(line: 725, column: 26, scope: !46)
!54 = !DILocation(line: 727, column: 13, scope: !46)
!55 = !DILocation(line: 730, column: 1, scope: !46)
!56 = distinct !DISubprogram(name: "closer2", scope: !1, file: !1, line: 732, type: !8, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 734, column: 23, scope: !56)
!58 = !DILocation(line: 735, column: 9, scope: !56)
!59 = distinct !{!59, !58, !58}
!60 = distinct !{!60, !58, !58}
!61 = distinct !{!61, !58, !58}
!62 = !DILocation(line: 736, column: 26, scope: !56)
!63 = !DILocation(line: 738, column: 13, scope: !56)
!64 = !DILocation(line: 741, column: 1, scope: !56)
!65 = distinct !DISubprogram(name: "closer3", scope: !1, file: !1, line: 743, type: !8, scopeLine: 743, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 745, column: 23, scope: !65)
!67 = !DILocation(line: 746, column: 9, scope: !65)
!68 = distinct !{!68, !67, !67}
!69 = distinct !{!69, !67, !67}
!70 = distinct !{!70, !67, !67}
!71 = !DILocation(line: 747, column: 26, scope: !65)
!72 = !DILocation(line: 748, column: 9, scope: !65)
!73 = distinct !{!73, !72, !72}
!74 = distinct !{!74, !72, !72}
!75 = !{!76, !76, i64 0}
!76 = !{!"long", !28, i64 0}
!77 = !DILocation(line: 749, column: 13, scope: !65)
!78 = !DILocation(line: 752, column: 1, scope: !65)
!79 = distinct !DISubprogram(name: "writer_isr_1", scope: !1, file: !1, line: 754, type: !8, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 758, column: 9, scope: !79)
!81 = distinct !{!81, !80, !80}
!82 = distinct !{!82, !80, !80}
!83 = distinct !{!83, !80, !80}
!84 = !DILocation(line: 759, column: 13, scope: !79)
!85 = !DILocation(line: 762, column: 1, scope: !79)
!86 = distinct !DISubprogram(name: "writer_isr_2", scope: !1, file: !1, line: 764, type: !8, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 768, column: 9, scope: !86)
!88 = distinct !{!88, !87, !87}
!89 = distinct !{!89, !87, !87}
!90 = distinct !{!90, !87, !87}
!91 = !DILocation(line: 769, column: 13, scope: !86)
!92 = !DILocation(line: 772, column: 1, scope: !86)
!93 = distinct !DISubprogram(name: "writer_isr_3", scope: !1, file: !1, line: 774, type: !8, scopeLine: 774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 776, column: 9, scope: !93)
!95 = distinct !{!95, !94, !94}
!96 = distinct !{!96, !94, !94}
!97 = distinct !{!97, !94, !94}
!98 = !DILocation(line: 777, column: 13, scope: !93)
!99 = !DILocation(line: 780, column: 1, scope: !93)
!100 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !1, file: !1, line: 921, type: !8, scopeLine: 921, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 923, column: 20, scope: !100)
!102 = !DILocation(line: 723, column: 23, scope: !46, inlinedAt: !103)
!103 = distinct !DILocation(line: 928, column: 5, scope: !100)
!104 = !DILocation(line: 724, column: 9, scope: !46, inlinedAt: !103)
!105 = !DILocation(line: 725, column: 26, scope: !46, inlinedAt: !103)
!106 = !DILocation(line: 727, column: 13, scope: !46, inlinedAt: !103)
!107 = !DILocation(line: 734, column: 23, scope: !56, inlinedAt: !108)
!108 = distinct !DILocation(line: 930, column: 5, scope: !100)
!109 = !DILocation(line: 735, column: 9, scope: !56, inlinedAt: !108)
!110 = !DILocation(line: 736, column: 26, scope: !56, inlinedAt: !108)
!111 = !DILocation(line: 738, column: 13, scope: !56, inlinedAt: !108)
!112 = !DILocation(line: 745, column: 23, scope: !65, inlinedAt: !113)
!113 = distinct !DILocation(line: 932, column: 5, scope: !100)
!114 = !DILocation(line: 746, column: 9, scope: !65, inlinedAt: !113)
!115 = !DILocation(line: 747, column: 26, scope: !65, inlinedAt: !113)
!116 = !DILocation(line: 748, column: 9, scope: !65, inlinedAt: !113)
!117 = !DILocation(line: 749, column: 13, scope: !65, inlinedAt: !113)
!118 = !DILocation(line: 962, column: 1, scope: !100)
