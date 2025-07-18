; ModuleID = 'i8xx_tco_3.bc'
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

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i16 @__uint16_identity(i16 zeroext %0) #0 !dbg !7 {
  %2 = alloca i16, align 2
  store i16 %0, i16* %2, align 2, !tbaa !10
  %3 = load i16, i16* %2, align 2, !dbg !14, !tbaa !10
  ret i16 %3, !dbg !15
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @__uint32_identity(i32 %0) #0 !dbg !16 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !17
  %3 = load i32, i32* %2, align 4, !dbg !19, !tbaa !17
  ret i32 %3, !dbg !20
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @__uint64_identity(i64 %0) #0 !dbg !21 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !22
  %3 = load i64, i64* %2, align 8, !dbg !24, !tbaa !22
  ret i64 %3, !dbg !25
}

; Function Attrs: inlinehint nounwind readnone uwtable
define available_externally i32 @pthread_equal(i64 %0, i64 %1) #1 !dbg !26 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8, !tbaa !22
  store i64 %1, i64* %4, align 8, !tbaa !22
  %5 = load i64, i64* %3, align 8, !dbg !28, !tbaa !22
  %6 = load i64, i64* %4, align 8, !dbg !29, !tbaa !22
  %7 = icmp eq i64 %5, %6, !dbg !30
  %8 = zext i1 %7 to i32, !dbg !30
  ret i32 %8, !dbg !31
}

; Function Attrs: nounwind uwtable
define zeroext i8 @seconds_to_ticks(i32 %0) #2 !dbg !32 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !17
  %3 = load i32, i32* %2, align 4, !dbg !33, !tbaa !17
  %4 = mul nsw i32 %3, 10, !dbg !34
  %5 = sdiv i32 %4, 6, !dbg !35
  %6 = trunc i32 %5 to i8, !dbg !36
  ret i8 %6, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @tco_timer_set_heartbeat(i32 %0) #2 !dbg !38 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i32
  store i32 %0, i32* %3, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %4) #4, !dbg !39
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #4, !dbg !40
  %7 = load i32, i32* %3, align 4, !dbg !41, !tbaa !17
  %8 = call zeroext i8 @seconds_to_ticks(i32 %7), !dbg !42
  store i8 %8, i8* %5, align 1, !dbg !43, !tbaa !44
  %9 = load i8, i8* %5, align 1, !dbg !45, !tbaa !44
  %10 = zext i8 %9 to i32, !dbg !45
  %11 = icmp sgt i32 %10, 63, !dbg !46
  br i1 %11, label %16, label %12, !dbg !47

12:                                               ; preds = %1
  %13 = load i8, i8* %5, align 1, !dbg !48, !tbaa !44
  %14 = zext i8 %13 to i32, !dbg !48
  %15 = icmp slt i32 %14, 4, !dbg !49
  br i1 %15, label %16, label %17, !dbg !45

16:                                               ; preds = %12, %1
  store i32 -22, i32* %2, align 4, !dbg !50
  store i32 1, i32* %6, align 4
  br label %48, !dbg !50

17:                                               ; preds = %12
  br label %18, !dbg !51, !llvm.loop !52

18:                                               ; preds = %17
  br label %19, !dbg !51

19:                                               ; preds = %22, %18
  %20 = load i8, i8* @tco_lock, align 1, !dbg !51, !tbaa !53, !range !55
  %21 = trunc i8 %20 to i1, !dbg !51
  br i1 %21, label %22, label %23, !dbg !51

22:                                               ; preds = %19
  br label %19, !dbg !51, !llvm.loop !56

23:                                               ; preds = %19
  br label %24, !dbg !51

24:                                               ; preds = %23
  br label %25, !dbg !51

25:                                               ; preds = %24
  store i8 0, i8* %4, align 1, !dbg !57, !tbaa !44
  %26 = load i8, i8* %4, align 1, !dbg !58, !tbaa !44
  %27 = zext i8 %26 to i32, !dbg !58
  %28 = and i32 %27, 192, !dbg !58
  %29 = trunc i32 %28 to i8, !dbg !58
  store i8 %29, i8* %4, align 1, !dbg !58, !tbaa !44
  %30 = load i8, i8* %5, align 1, !dbg !59, !tbaa !44
  %31 = zext i8 %30 to i32, !dbg !59
  %32 = load i8, i8* %4, align 1, !dbg !60, !tbaa !44
  %33 = zext i8 %32 to i32, !dbg !60
  %34 = or i32 %33, %31, !dbg !60
  %35 = trunc i32 %34 to i8, !dbg !60
  store i8 %35, i8* %4, align 1, !dbg !60, !tbaa !44
  store i8 0, i8* %4, align 1, !dbg !61, !tbaa !44
  br label %36, !dbg !62, !llvm.loop !63

36:                                               ; preds = %25
  store i8 0, i8* @tco_lock, align 1, !dbg !62, !tbaa !53
  br label %37, !dbg !62

37:                                               ; preds = %36
  br label %38, !dbg !62

38:                                               ; preds = %37
  %39 = load i8, i8* %4, align 1, !dbg !64, !tbaa !44
  %40 = zext i8 %39 to i32, !dbg !64
  %41 = and i32 %40, 63, !dbg !65
  %42 = load i8, i8* %5, align 1, !dbg !66, !tbaa !44
  %43 = zext i8 %42 to i32, !dbg !66
  %44 = icmp ne i32 %41, %43, !dbg !67
  br i1 %44, label %45, label %46, !dbg !68

45:                                               ; preds = %38
  store i32 -22, i32* %2, align 4, !dbg !69
  store i32 1, i32* %6, align 4
  br label %48, !dbg !69

46:                                               ; preds = %38
  %47 = load i32, i32* %3, align 4, !dbg !70, !tbaa !17
  store i32 %47, i32* @heartbeat, align 4, !dbg !71, !tbaa !17
  store i32 0, i32* %2, align 4, !dbg !72
  store i32 1, i32* %6, align 4
  br label %48, !dbg !72

48:                                               ; preds = %46, %45, %16
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #4, !dbg !73
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %4) #4, !dbg !73
  %49 = load i32, i32* %2, align 4, !dbg !73
  ret i32 %49, !dbg !73
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define internal i32 @tco_timer_get_timeleft(i32* %0) #2 !dbg !74 {
  %2 = alloca i32*, align 8
  %3 = alloca i8, align 1
  store i32* %0, i32** %2, align 8, !tbaa !75
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %3) #4, !dbg !77
  br label %4, !dbg !78, !llvm.loop !79

4:                                                ; preds = %1
  br label %5, !dbg !78

5:                                                ; preds = %8, %4
  %6 = load i8, i8* @tco_lock, align 1, !dbg !78, !tbaa !53, !range !55
  %7 = trunc i8 %6 to i1, !dbg !78
  br i1 %7, label %8, label %9, !dbg !78

8:                                                ; preds = %5
  br label %5, !dbg !78, !llvm.loop !80

9:                                                ; preds = %5
  br label %10, !dbg !78

10:                                               ; preds = %9
  br label %11, !dbg !78

11:                                               ; preds = %10
  store i8 0, i8* %3, align 1, !dbg !81, !tbaa !44
  %12 = load i8, i8* %3, align 1, !dbg !82, !tbaa !44
  %13 = zext i8 %12 to i32, !dbg !82
  %14 = and i32 %13, 63, !dbg !82
  %15 = trunc i32 %14 to i8, !dbg !82
  store i8 %15, i8* %3, align 1, !dbg !82, !tbaa !44
  br label %16, !dbg !83, !llvm.loop !84

16:                                               ; preds = %11
  store i8 0, i8* @tco_lock, align 1, !dbg !83, !tbaa !53
  br label %17, !dbg !83

17:                                               ; preds = %16
  br label %18, !dbg !83

18:                                               ; preds = %17
  %19 = load i8, i8* %3, align 1, !dbg !85, !tbaa !44
  %20 = zext i8 %19 to i32, !dbg !85
  %21 = mul nsw i32 %20, 6, !dbg !86
  %22 = sdiv i32 %21, 10, !dbg !87
  %23 = load i32*, i32** %2, align 8, !dbg !88, !tbaa !75
  store i32 %22, i32* %23, align 4, !dbg !89, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %3) #4, !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind uwtable
define void @closer1() #2 !dbg !92 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !93, !tbaa !44
  br label %1, !dbg !94, !llvm.loop !95

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !94, !tbaa !17
  %3 = icmp ne i32 %2, 0, !dbg !94
  br i1 %3, label %10, label %4, !dbg !94

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !94, !tbaa !44
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !94, !tbaa !44
  %6 = sext i8 %5 to i32, !dbg !94
  %7 = icmp eq i32 %6, 86, !dbg !94
  br i1 %7, label %8, label %9, !dbg !94

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !94, !tbaa !44
  br label %9, !dbg !94

9:                                                ; preds = %8, %4
  br label %10, !dbg !94

10:                                               ; preds = %9, %1
  br label %11, !dbg !94, !llvm.loop !96

11:                                               ; preds = %10
  br label %12, !dbg !94, !llvm.loop !97

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !94, !tbaa !44
  br label %13, !dbg !94

13:                                               ; preds = %12
  br label %14, !dbg !94

14:                                               ; preds = %13
  br label %15, !dbg !94

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !98, !tbaa !44
  %16 = load i32, i32* @cnt1, align 4, !dbg !99, !tbaa !17
  %17 = add nsw i32 %16, 1, !dbg !99
  store i32 %17, i32* @cnt1, align 4, !dbg !99, !tbaa !17
  ret void, !dbg !100
}

; Function Attrs: nounwind uwtable
define void @closer2() #2 !dbg !101 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !102, !tbaa !44
  br label %1, !dbg !103, !llvm.loop !104

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !103, !tbaa !17
  %3 = icmp ne i32 %2, 0, !dbg !103
  br i1 %3, label %10, label %4, !dbg !103

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !103, !tbaa !44
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !103, !tbaa !44
  %6 = sext i8 %5 to i32, !dbg !103
  %7 = icmp eq i32 %6, 86, !dbg !103
  br i1 %7, label %8, label %9, !dbg !103

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !103, !tbaa !44
  br label %9, !dbg !103

9:                                                ; preds = %8, %4
  br label %10, !dbg !103

10:                                               ; preds = %9, %1
  br label %11, !dbg !103, !llvm.loop !105

11:                                               ; preds = %10
  br label %12, !dbg !103, !llvm.loop !106

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !103, !tbaa !44
  br label %13, !dbg !103

13:                                               ; preds = %12
  br label %14, !dbg !103

14:                                               ; preds = %13
  br label %15, !dbg !103

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !107, !tbaa !44
  %16 = load i32, i32* @cnt2, align 4, !dbg !108, !tbaa !17
  %17 = add nsw i32 %16, 1, !dbg !108
  store i32 %17, i32* @cnt2, align 4, !dbg !108, !tbaa !17
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define void @closer3() #2 !dbg !110 {
  store i8 86, i8* @tco_write_buf, align 1, !dbg !111, !tbaa !44
  br label %1, !dbg !112, !llvm.loop !113

1:                                                ; preds = %0
  %2 = load i32, i32* @nowayout, align 4, !dbg !112, !tbaa !17
  %3 = icmp ne i32 %2, 0, !dbg !112
  br i1 %3, label %10, label %4, !dbg !112

4:                                                ; preds = %1
  store i8 0, i8* @tco_expect_close, align 1, !dbg !112, !tbaa !44
  %5 = load i8, i8* @tco_write_buf, align 1, !dbg !112, !tbaa !44
  %6 = sext i8 %5 to i32, !dbg !112
  %7 = icmp eq i32 %6, 86, !dbg !112
  br i1 %7, label %8, label %9, !dbg !112

8:                                                ; preds = %4
  store i8 42, i8* @tco_expect_close, align 1, !dbg !112, !tbaa !44
  br label %9, !dbg !112

9:                                                ; preds = %8, %4
  br label %10, !dbg !112

10:                                               ; preds = %9, %1
  br label %11, !dbg !112, !llvm.loop !114

11:                                               ; preds = %10
  br label %12, !dbg !112, !llvm.loop !115

12:                                               ; preds = %11
  store i8 1, i8* @tco1_rld, align 1, !dbg !112, !tbaa !44
  br label %13, !dbg !112

13:                                               ; preds = %12
  br label %14, !dbg !112

14:                                               ; preds = %13
  br label %15, !dbg !112

15:                                               ; preds = %14
  store i8 42, i8* @tco_expect_close, align 1, !dbg !116, !tbaa !44
  br label %16, !dbg !117, !llvm.loop !118

16:                                               ; preds = %15
  %17 = load i8, i8* @tco_expect_close, align 1, !dbg !117, !tbaa !44
  %18 = sext i8 %17 to i32, !dbg !117
  %19 = icmp ne i32 %18, 42, !dbg !117
  br i1 %19, label %20, label %21, !dbg !117

20:                                               ; preds = %16
  br label %22, !dbg !117

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %20
  br label %23, !dbg !117, !llvm.loop !119

23:                                               ; preds = %22
  store i64 0, i64* @timer_alive, align 8, !dbg !117, !tbaa !22
  br label %24, !dbg !117

24:                                               ; preds = %23
  store i8 0, i8* @tco_expect_close, align 1, !dbg !117, !tbaa !44
  br label %25, !dbg !117

25:                                               ; preds = %24
  %26 = load i32, i32* @cnt3, align 4, !dbg !120, !tbaa !17
  %27 = add nsw i32 %26, 1, !dbg !120
  store i32 %27, i32* @cnt3, align 4, !dbg !120, !tbaa !17
  ret void, !dbg !121
}

; Function Attrs: nounwind uwtable
define void @writer_isr_1() #2 !dbg !122 {
  br label %1, !dbg !123, !llvm.loop !124

1:                                                ; preds = %0
  br label %2, !dbg !123, !llvm.loop !125

2:                                                ; preds = %1
  br label %3, !dbg !123, !llvm.loop !126

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !123, !tbaa !44
  br label %4, !dbg !123

4:                                                ; preds = %3
  br label %5, !dbg !123

5:                                                ; preds = %4
  br label %6, !dbg !123

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt4, align 4, !dbg !127, !tbaa !17
  %8 = add nsw i32 %7, 1, !dbg !127
  store i32 %8, i32* @cnt4, align 4, !dbg !127, !tbaa !17
  ret void, !dbg !128
}

; Function Attrs: nounwind uwtable
define void @writer_isr_2() #2 !dbg !129 {
  br label %1, !dbg !130, !llvm.loop !131

1:                                                ; preds = %0
  br label %2, !dbg !130, !llvm.loop !132

2:                                                ; preds = %1
  br label %3, !dbg !130, !llvm.loop !133

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !130, !tbaa !44
  br label %4, !dbg !130

4:                                                ; preds = %3
  br label %5, !dbg !130

5:                                                ; preds = %4
  br label %6, !dbg !130

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt5, align 4, !dbg !134, !tbaa !17
  %8 = add nsw i32 %7, 1, !dbg !134
  store i32 %8, i32* @cnt5, align 4, !dbg !134, !tbaa !17
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define void @writer_isr_3() #2 !dbg !136 {
  br label %1, !dbg !137, !llvm.loop !138

1:                                                ; preds = %0
  br label %2, !dbg !137, !llvm.loop !139

2:                                                ; preds = %1
  br label %3, !dbg !137, !llvm.loop !140

3:                                                ; preds = %2
  store i8 1, i8* @tco1_rld, align 1, !dbg !137, !tbaa !44
  br label %4, !dbg !137

4:                                                ; preds = %3
  br label %5, !dbg !137

5:                                                ; preds = %4
  br label %6, !dbg !137

6:                                                ; preds = %5
  %7 = load i32, i32* @cnt6, align 4, !dbg !141, !tbaa !17
  %8 = add nsw i32 %7, 1, !dbg !141
  store i32 %8, i32* @cnt6, align 4, !dbg !141, !tbaa !17
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_012_001_main(i32 %0, i8** %1) #2 !dbg !143 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4, !tbaa !17
  store i8** %1, i8*** %5, align 8, !tbaa !75
  store i8 0, i8* @tco_expect_close, align 1, !dbg !144, !tbaa !44
  call void @closer1(), !dbg !145
  call void @closer2(), !dbg !146
  call void @closer3(), !dbg !147
  %6 = load i32, i32* %3, align 4, !dbg !148
  ret i32 %6, !dbg !148
}

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

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
!7 = distinct !DISubprogram(name: "__uint16_identity", scope: !8, file: !8, line: 33, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 35, column: 10, scope: !7)
!15 = !DILocation(line: 35, column: 3, scope: !7)
!16 = distinct !DISubprogram(name: "__uint32_identity", scope: !8, file: !8, line: 39, type: !9, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !12, i64 0}
!19 = !DILocation(line: 41, column: 10, scope: !16)
!20 = !DILocation(line: 41, column: 3, scope: !16)
!21 = distinct !DISubprogram(name: "__uint64_identity", scope: !8, file: !8, line: 45, type: !9, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !{!23, !23, i64 0}
!23 = !{!"long", !12, i64 0}
!24 = !DILocation(line: 47, column: 10, scope: !21)
!25 = !DILocation(line: 47, column: 3, scope: !21)
!26 = distinct !DISubprogram(name: "pthread_equal", scope: !27, file: !27, line: 1154, type: !9, scopeLine: 1155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DIFile(filename: "/usr/include/pthread.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco")
!28 = !DILocation(line: 1156, column: 10, scope: !26)
!29 = !DILocation(line: 1156, column: 23, scope: !26)
!30 = !DILocation(line: 1156, column: 20, scope: !26)
!31 = !DILocation(line: 1156, column: 3, scope: !26)
!32 = distinct !DISubprogram(name: "seconds_to_ticks", scope: !1, file: !1, line: 177, type: !9, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 181, column: 10, scope: !32)
!34 = !DILocation(line: 181, column: 18, scope: !32)
!35 = !DILocation(line: 181, column: 24, scope: !32)
!36 = !DILocation(line: 181, column: 9, scope: !32)
!37 = !DILocation(line: 181, column: 2, scope: !32)
!38 = distinct !DISubprogram(name: "tco_timer_set_heartbeat", scope: !1, file: !1, line: 265, type: !9, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 267, column: 2, scope: !38)
!40 = !DILocation(line: 268, column: 2, scope: !38)
!41 = !DILocation(line: 270, column: 28, scope: !38)
!42 = !DILocation(line: 270, column: 11, scope: !38)
!43 = !DILocation(line: 270, column: 9, scope: !38)
!44 = !{!12, !12, i64 0}
!45 = !DILocation(line: 273, column: 6, scope: !38)
!46 = !DILocation(line: 273, column: 13, scope: !38)
!47 = !DILocation(line: 273, column: 20, scope: !38)
!48 = !DILocation(line: 273, column: 23, scope: !38)
!49 = !DILocation(line: 273, column: 30, scope: !38)
!50 = !DILocation(line: 274, column: 3, scope: !38)
!51 = !DILocation(line: 277, column: 2, scope: !38)
!52 = distinct !{!52, !51, !51}
!53 = !{!54, !54, i64 0}
!54 = !{!"_Bool", !12, i64 0}
!55 = !{i8 0, i8 2}
!56 = distinct !{!56, !51, !51}
!57 = !DILocation(line: 278, column: 6, scope: !38)
!58 = !DILocation(line: 279, column: 6, scope: !38)
!59 = !DILocation(line: 280, column: 9, scope: !38)
!60 = !DILocation(line: 280, column: 6, scope: !38)
!61 = !DILocation(line: 283, column: 6, scope: !38)
!62 = !DILocation(line: 284, column: 2, scope: !38)
!63 = distinct !{!63, !62, !62}
!64 = !DILocation(line: 286, column: 7, scope: !38)
!65 = !DILocation(line: 286, column: 11, scope: !38)
!66 = !DILocation(line: 286, column: 22, scope: !38)
!67 = !DILocation(line: 286, column: 19, scope: !38)
!68 = !DILocation(line: 286, column: 6, scope: !38)
!69 = !DILocation(line: 287, column: 3, scope: !38)
!70 = !DILocation(line: 289, column: 14, scope: !38)
!71 = !DILocation(line: 289, column: 12, scope: !38)
!72 = !DILocation(line: 290, column: 2, scope: !38)
!73 = !DILocation(line: 291, column: 1, scope: !38)
!74 = distinct !DISubprogram(name: "tco_timer_get_timeleft", scope: !1, file: !1, line: 293, type: !9, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!75 = !{!76, !76, i64 0}
!76 = !{!"any pointer", !12, i64 0}
!77 = !DILocation(line: 295, column: 2, scope: !74)
!78 = !DILocation(line: 297, column: 2, scope: !74)
!79 = distinct !{!79, !78, !78}
!80 = distinct !{!80, !78, !78}
!81 = !DILocation(line: 300, column: 6, scope: !74)
!82 = !DILocation(line: 301, column: 6, scope: !74)
!83 = !DILocation(line: 303, column: 2, scope: !74)
!84 = distinct !{!84, !83, !83}
!85 = !DILocation(line: 305, column: 22, scope: !74)
!86 = !DILocation(line: 305, column: 26, scope: !74)
!87 = !DILocation(line: 305, column: 31, scope: !74)
!88 = !DILocation(line: 305, column: 3, scope: !74)
!89 = !DILocation(line: 305, column: 13, scope: !74)
!90 = !DILocation(line: 308, column: 1, scope: !74)
!91 = !DILocation(line: 307, column: 2, scope: !74)
!92 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 719, type: !9, scopeLine: 719, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 723, column: 23, scope: !92)
!94 = !DILocation(line: 724, column: 9, scope: !92)
!95 = distinct !{!95, !94, !94}
!96 = distinct !{!96, !94, !94}
!97 = distinct !{!97, !94, !94}
!98 = !DILocation(line: 725, column: 26, scope: !92)
!99 = !DILocation(line: 727, column: 13, scope: !92)
!100 = !DILocation(line: 730, column: 1, scope: !92)
!101 = distinct !DISubprogram(name: "closer2", scope: !1, file: !1, line: 732, type: !9, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 734, column: 23, scope: !101)
!103 = !DILocation(line: 735, column: 9, scope: !101)
!104 = distinct !{!104, !103, !103}
!105 = distinct !{!105, !103, !103}
!106 = distinct !{!106, !103, !103}
!107 = !DILocation(line: 736, column: 26, scope: !101)
!108 = !DILocation(line: 738, column: 13, scope: !101)
!109 = !DILocation(line: 741, column: 1, scope: !101)
!110 = distinct !DISubprogram(name: "closer3", scope: !1, file: !1, line: 743, type: !9, scopeLine: 743, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 745, column: 23, scope: !110)
!112 = !DILocation(line: 746, column: 9, scope: !110)
!113 = distinct !{!113, !112, !112}
!114 = distinct !{!114, !112, !112}
!115 = distinct !{!115, !112, !112}
!116 = !DILocation(line: 747, column: 26, scope: !110)
!117 = !DILocation(line: 748, column: 9, scope: !110)
!118 = distinct !{!118, !117, !117}
!119 = distinct !{!119, !117, !117}
!120 = !DILocation(line: 749, column: 13, scope: !110)
!121 = !DILocation(line: 752, column: 1, scope: !110)
!122 = distinct !DISubprogram(name: "writer_isr_1", scope: !1, file: !1, line: 754, type: !9, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 758, column: 9, scope: !122)
!124 = distinct !{!124, !123, !123}
!125 = distinct !{!125, !123, !123}
!126 = distinct !{!126, !123, !123}
!127 = !DILocation(line: 759, column: 13, scope: !122)
!128 = !DILocation(line: 762, column: 1, scope: !122)
!129 = distinct !DISubprogram(name: "writer_isr_2", scope: !1, file: !1, line: 764, type: !9, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!130 = !DILocation(line: 768, column: 9, scope: !129)
!131 = distinct !{!131, !130, !130}
!132 = distinct !{!132, !130, !130}
!133 = distinct !{!133, !130, !130}
!134 = !DILocation(line: 769, column: 13, scope: !129)
!135 = !DILocation(line: 772, column: 1, scope: !129)
!136 = distinct !DISubprogram(name: "writer_isr_3", scope: !1, file: !1, line: 774, type: !9, scopeLine: 774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!137 = !DILocation(line: 776, column: 9, scope: !136)
!138 = distinct !{!138, !137, !137}
!139 = distinct !{!139, !137, !137}
!140 = distinct !{!140, !137, !137}
!141 = !DILocation(line: 777, column: 13, scope: !136)
!142 = !DILocation(line: 780, column: 1, scope: !136)
!143 = distinct !DISubprogram(name: "svp_simple_012_001_main", scope: !1, file: !1, line: 921, type: !9, scopeLine: 921, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!144 = !DILocation(line: 923, column: 20, scope: !143)
!145 = !DILocation(line: 928, column: 5, scope: !143)
!146 = !DILocation(line: 930, column: 5, scope: !143)
!147 = !DILocation(line: 932, column: 5, scope: !143)
!148 = !DILocation(line: 962, column: 1, scope: !143)
