; ModuleID = 'brake1-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake/brake1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@stdout = external global %struct._IO_FILE*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh = global i32 100, align 4
@brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh = global i32 100, align 4
@brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh = global i32 100, align 4
@brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh = global i32 100, align 4
@cnt1 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT_h = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT4_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT4 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT1_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT1 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT2_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT2 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT3_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT3 = common global i32 0, align 4
@test = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Distribution_Gain1 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT14 = common global i32 0, align 4
@Distribution_idx = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Distribution_Gain2 = common global i32 0, align 4
@Distribution_idx_0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Distribution_Gain3 = common global i32 0, align 4
@Distribution_idx_1 = common global i32 0, align 4
@RT9 = common global i32 0, align 4
@RT10 = common global i32 0, align 4
@vkmh = common global i32 0, align 4
@RT11 = common global i32 0, align 4
@RT12 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_average_rpm_Gain = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_wgrads_Gain = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_vkmh_Gain = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Distribution_Gain0 = common global i32 0, align 4
@RT_Buffer0 = common global i32 0, align 4
@RT4_Buffer0 = common global i32 0, align 4
@RT1_Buffer0 = common global i32 0, align 4
@RT2_Buffer0 = common global i32 0, align 4
@RT3_Buffer0 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Gain1_Gain = common global i32 0, align 4
@RT14 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RTH = common global i32 0, align 4
@RT0_Buffer0 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #0

declare i32 @_IO_getc(%struct._IO_FILE*) #0

; Function Attrs: nounwind readnone willreturn
declare i64 @llvm.expect.i64(i64, i64) #1

declare i32 @__uflow(%struct._IO_FILE*) #0

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #0

declare i32 @__overflow(%struct._IO_FILE*, i32) #0

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #2

; Function Attrs: nounwind
declare i64 @strtoll(i8*, i8**, i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind
declare double @strtod(i8*, i8**) #2

; Function Attrs: nounwind uwtable
define void @task_isr_1() #4 !dbg !7 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !9, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !9
  store i32 %2, i32* @cnt1, align 4, !dbg !9, !tbaa !10
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !14, !tbaa !10
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !15, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !16, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !17, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !18, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !19, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !20, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !21, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !22, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !23, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !24, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !25, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !26, !tbaa !10
  %10 = add nsw i32 %8, %9, !dbg !27
  store i32 %10, i32* @Distribution_idx, align 4, !dbg !28, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !29, !tbaa !10
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !30, !tbaa !10
  %13 = add nsw i32 %11, %12, !dbg !31
  store i32 %13, i32* @Distribution_idx_0, align 4, !dbg !32, !tbaa !10
  %14 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !33, !tbaa !10
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !34, !tbaa !10
  %16 = add nsw i32 %14, %15, !dbg !35
  store i32 %16, i32* @Distribution_idx_1, align 4, !dbg !36, !tbaa !10
  %17 = load i32, i32* @RT9, align 4, !dbg !37, !tbaa !10
  %18 = load i32, i32* @RT10, align 4, !dbg !38, !tbaa !10
  %19 = add nsw i32 %17, %18, !dbg !39
  store i32 %19, i32* @vkmh, align 4, !dbg !40, !tbaa !10
  %20 = load i32, i32* @vkmh, align 4, !dbg !41, !tbaa !10
  %21 = load i32, i32* @RT11, align 4, !dbg !42, !tbaa !10
  %22 = add nsw i32 %20, %21, !dbg !43
  store i32 %22, i32* @vkmh, align 4, !dbg !44, !tbaa !10
  %23 = load i32, i32* @vkmh, align 4, !dbg !45, !tbaa !10
  %24 = load i32, i32* @RT12, align 4, !dbg !46, !tbaa !10
  %25 = add nsw i32 %23, %24, !dbg !47
  store i32 %25, i32* @vkmh, align 4, !dbg !48, !tbaa !10
  %26 = load i32, i32* @vkmh, align 4, !dbg !49, !tbaa !10
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_P_average_rpm_Gain, align 4, !dbg !50, !tbaa !10
  %28 = add nsw i32 %26, %27, !dbg !51
  store i32 %28, i32* @vkmh, align 4, !dbg !52, !tbaa !10
  %29 = load i32, i32* @vkmh, align 4, !dbg !53, !tbaa !10
  %30 = load i32, i32* @brake_acc_nodiv_ctrl_P_wgrads_Gain, align 4, !dbg !54, !tbaa !10
  %31 = add nsw i32 %29, %30, !dbg !55
  store i32 %31, i32* @vkmh, align 4, !dbg !56, !tbaa !10
  %32 = load i32, i32* @vkmh, align 4, !dbg !57, !tbaa !10
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_P_vkmh_Gain, align 4, !dbg !58, !tbaa !10
  %34 = add nsw i32 %32, %33, !dbg !59
  store i32 %34, i32* @vkmh, align 4, !dbg !60, !tbaa !10
  %35 = load i32, i32* @test, align 4, !dbg !61, !tbaa !10
  %36 = icmp ne i32 %35, 0, !dbg !62
  br i1 %36, label %37, label %38, !dbg !61

37:                                               ; preds = %0
  br label %38, !dbg !63

38:                                               ; preds = %37, %0
  %39 = load i32, i32* @test, align 4, !dbg !64, !tbaa !10
  %40 = icmp ne i32 %39, 1, !dbg !65
  br i1 %40, label %41, label %42, !dbg !64

41:                                               ; preds = %38
  br label %42, !dbg !66

42:                                               ; preds = %41, %38
  %43 = load i32, i32* @test, align 4, !dbg !67, !tbaa !10
  %44 = icmp ne i32 %43, 2, !dbg !68
  br i1 %44, label %45, label %46, !dbg !67

45:                                               ; preds = %42
  br label %46, !dbg !69

46:                                               ; preds = %45, %42
  %47 = load i32, i32* @test, align 4, !dbg !70, !tbaa !10
  %48 = icmp ne i32 %47, 3, !dbg !71
  br i1 %48, label %49, label %50, !dbg !70

49:                                               ; preds = %46
  br label %50, !dbg !72

50:                                               ; preds = %49, %46
  %51 = load i32, i32* @test, align 4, !dbg !73, !tbaa !10
  %52 = icmp sle i32 %51, 0, !dbg !74
  br i1 %52, label %53, label %54, !dbg !73

53:                                               ; preds = %50
  br label %54, !dbg !75

54:                                               ; preds = %53, %50
  %55 = load i32, i32* @test, align 4, !dbg !76, !tbaa !10
  %56 = add nsw i32 %55, 1, !dbg !76
  store i32 %56, i32* @test, align 4, !dbg !76, !tbaa !10
  %57 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain0, align 4, !dbg !77, !tbaa !10
  %58 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !78, !tbaa !10
  %59 = add nsw i32 %57, %58, !dbg !79
  store i32 %59, i32* @RT_Buffer0, align 4, !dbg !80, !tbaa !10
  %60 = load i32, i32* @vkmh, align 4, !dbg !81, !tbaa !10
  store i32 %60, i32* @RT4_Buffer0, align 4, !dbg !82, !tbaa !10
  %61 = load i32, i32* @Distribution_idx, align 4, !dbg !83, !tbaa !10
  store i32 %61, i32* @RT1_Buffer0, align 4, !dbg !84, !tbaa !10
  %62 = load i32, i32* @Distribution_idx_0, align 4, !dbg !85, !tbaa !10
  store i32 %62, i32* @RT2_Buffer0, align 4, !dbg !86, !tbaa !10
  %63 = load i32, i32* @Distribution_idx_1, align 4, !dbg !87, !tbaa !10
  store i32 %63, i32* @RT3_Buffer0, align 4, !dbg !88, !tbaa !10
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #4 !dbg !90 {
  %1 = load i32, i32* @cnt2, align 4, !dbg !91, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !91
  store i32 %2, i32* @cnt2, align 4, !dbg !91, !tbaa !10
  store i32 1, i32* @test, align 4, !dbg !92, !tbaa !10
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !93, !tbaa !10
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !94, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !95, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !96, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !97, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !98, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !99, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !100, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !101, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !102, !tbaa !10
  %8 = load i32, i32* @RT_Buffer0, align 4, !dbg !103, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !104, !tbaa !10
  %9 = load i32, i32* @RT4_Buffer0, align 4, !dbg !105, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !106, !tbaa !10
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !107, !tbaa !10
  %11 = add nsw i32 10, %10, !dbg !108
  %12 = add nsw i32 %11, 10, !dbg !109
  %13 = add nsw i32 %12, 10, !dbg !110
  %14 = icmp sge i32 %13, 100, !dbg !111
  br i1 %14, label %15, label %16, !dbg !112

15:                                               ; preds = %0
  br label %20, !dbg !113

16:                                               ; preds = %0
  %17 = icmp sle i32 %13, 5, !dbg !114
  br i1 %17, label %18, label %19, !dbg !115

18:                                               ; preds = %16
  br label %19, !dbg !116

19:                                               ; preds = %18, %16
  br label %20

20:                                               ; preds = %19, %15
  %21 = add nsw i32 10, %11, !dbg !117
  %22 = icmp sgt i32 10, %21, !dbg !118
  br i1 %22, label %23, label %24, !dbg !119

23:                                               ; preds = %20
  br label %25, !dbg !120

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24, %23
  %.0 = phi i8 [ 1, %23 ], [ 0, %24 ], !dbg !121
  %26 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !122, !tbaa !10
  %27 = icmp sge i32 %26, 100, !dbg !123
  br i1 %27, label %28, label %34, !dbg !122

28:                                               ; preds = %25
  %29 = trunc i8 %.0 to i1, !dbg !124
  br i1 %29, label %30, label %31, !dbg !124

30:                                               ; preds = %28
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !125, !tbaa !10
  br label %33, !dbg !126

31:                                               ; preds = %28
  %32 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !127, !tbaa !10
  store i32 %32, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !128, !tbaa !10
  br label %33

33:                                               ; preds = %31, %30
  br label %36, !dbg !129

34:                                               ; preds = %25
  %35 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !130, !tbaa !10
  store i32 %35, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !131, !tbaa !10
  br label %36

36:                                               ; preds = %34, %33
  %37 = load i32, i32* @RT1_Buffer0, align 4, !dbg !132, !tbaa !10
  store i32 %37, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !133, !tbaa !10
  store i32 10, i32* @RT9, align 4, !dbg !134, !tbaa !10
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define i8* @task_FL_Wheel(i8* %0) #4 !dbg !136 {
  %2 = load i32, i32* @test, align 4, !dbg !137, !tbaa !10
  %3 = add nsw i32 %2, 1, !dbg !137
  store i32 %3, i32* @test, align 4, !dbg !137, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !138, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !139, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !140, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !141, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !142, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !143, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !144, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !145, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !146, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !147, !tbaa !10
  %9 = load i32, i32* @RT_Buffer0, align 4, !dbg !148, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !149, !tbaa !10
  %10 = load i32, i32* @RT4_Buffer0, align 4, !dbg !150, !tbaa !10
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !151, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !152, !tbaa !10
  %12 = add nsw i32 10, %11, !dbg !153
  %13 = add nsw i32 %12, 10, !dbg !154
  %14 = add nsw i32 %13, 10, !dbg !155
  %15 = icmp sge i32 %14, 100, !dbg !156
  br i1 %15, label %16, label %17, !dbg !157

16:                                               ; preds = %1
  br label %21, !dbg !158

17:                                               ; preds = %1
  %18 = icmp sle i32 %14, 5, !dbg !159
  br i1 %18, label %19, label %20, !dbg !160

19:                                               ; preds = %17
  br label %20, !dbg !161

20:                                               ; preds = %19, %17
  br label %21

21:                                               ; preds = %20, %16
  %22 = add nsw i32 10, %12, !dbg !162
  %23 = icmp sgt i32 10, %22, !dbg !163
  br i1 %23, label %24, label %25, !dbg !164

24:                                               ; preds = %21
  br label %26, !dbg !165

25:                                               ; preds = %21
  br label %26

26:                                               ; preds = %25, %24
  %.02 = phi i8 [ 1, %24 ], [ 0, %25 ], !dbg !166
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !167, !tbaa !10
  %28 = icmp sge i32 %27, 100, !dbg !168
  br i1 %28, label %29, label %35, !dbg !167

29:                                               ; preds = %26
  %30 = trunc i8 %.02 to i1, !dbg !169
  br i1 %30, label %31, label %32, !dbg !169

31:                                               ; preds = %29
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !170, !tbaa !10
  br label %34, !dbg !171

32:                                               ; preds = %29
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !172, !tbaa !10
  store i32 %33, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !173, !tbaa !10
  br label %34

34:                                               ; preds = %32, %31
  br label %37, !dbg !174

35:                                               ; preds = %26
  %36 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !175, !tbaa !10
  store i32 %36, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !176, !tbaa !10
  br label %37

37:                                               ; preds = %35, %34
  %38 = trunc i8 %.02 to i1, !dbg !177
  br i1 %38, label %39, label %40, !dbg !177

39:                                               ; preds = %37
  br label %41, !dbg !178

40:                                               ; preds = %37
  br label %41

41:                                               ; preds = %40, %39
  %.01 = phi i32 [ 15, %39 ], [ 65, %40 ], !dbg !166
  %42 = icmp sge i32 %.01, 50, !dbg !179
  br i1 %42, label %43, label %44, !dbg !180

43:                                               ; preds = %41
  br label %44, !dbg !181

44:                                               ; preds = %43, %41
  %45 = icmp sle i32 %.01, 20, !dbg !182
  br i1 %45, label %46, label %47, !dbg !183

46:                                               ; preds = %44
  br label %48, !dbg !184

47:                                               ; preds = %44
  br label %48

48:                                               ; preds = %47, %46
  %.0 = phi i32 [ 20, %46 ], [ 15, %47 ], !dbg !166
  %49 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !185, !tbaa !10
  %50 = add nsw i32 %49, %.0, !dbg !186
  store i32 %50, i32* @RT14, align 4, !dbg !187, !tbaa !10
  store i32 10, i32* @RT12, align 4, !dbg !188, !tbaa !10
  ret i8* undef, !dbg !189
}

; Function Attrs: nounwind uwtable
define i8* @task_FR_Wheel(i8* %0) #4 !dbg !190 {
  %2 = load i32, i32* @test, align 4, !dbg !191, !tbaa !10
  %3 = add nsw i32 %2, 1, !dbg !191
  store i32 %3, i32* @test, align 4, !dbg !191, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !192, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !193, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !194, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !195, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !196, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !197, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !198, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !199, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !200, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !201, !tbaa !10
  %9 = load i32, i32* @RT4_Buffer0, align 4, !dbg !202, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !203, !tbaa !10
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !204, !tbaa !10
  %11 = add nsw i32 10, %10, !dbg !205
  %12 = add nsw i32 %11, 10, !dbg !206
  %13 = add nsw i32 %12, 10, !dbg !207
  %14 = icmp sge i32 %13, 100, !dbg !208
  br i1 %14, label %15, label %16, !dbg !209

15:                                               ; preds = %1
  br label %20, !dbg !210

16:                                               ; preds = %1
  %17 = icmp sle i32 %13, 5, !dbg !211
  br i1 %17, label %18, label %19, !dbg !212

18:                                               ; preds = %16
  br label %19, !dbg !213

19:                                               ; preds = %18, %16
  br label %20

20:                                               ; preds = %19, %15
  %21 = add nsw i32 10, %11, !dbg !214
  %22 = icmp sgt i32 10, %21, !dbg !215
  br i1 %22, label %23, label %24, !dbg !216

23:                                               ; preds = %20
  br label %25, !dbg !217

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24, %23
  %.0 = phi i8 [ 1, %23 ], [ 0, %24 ], !dbg !218
  %26 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !219, !tbaa !10
  %27 = icmp sge i32 %26, 100, !dbg !220
  br i1 %27, label %28, label %34, !dbg !219

28:                                               ; preds = %25
  %29 = trunc i8 %.0 to i1, !dbg !221
  br i1 %29, label %30, label %31, !dbg !221

30:                                               ; preds = %28
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !222, !tbaa !10
  br label %33, !dbg !223

31:                                               ; preds = %28
  %32 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !224, !tbaa !10
  store i32 %32, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !225, !tbaa !10
  br label %33

33:                                               ; preds = %31, %30
  br label %36, !dbg !226

34:                                               ; preds = %25
  %35 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !227, !tbaa !10
  store i32 %35, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !228, !tbaa !10
  br label %36

36:                                               ; preds = %34, %33
  %37 = load i32, i32* @RT3_Buffer0, align 4, !dbg !229, !tbaa !10
  store i32 %37, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !230, !tbaa !10
  store i32 10, i32* @RT11, align 4, !dbg !231, !tbaa !10
  ret i8* undef, !dbg !232
}

; Function Attrs: nounwind uwtable
define i8* @task_RL_Wheel(i8* %0) #4 !dbg !233 {
  %2 = load i32, i32* @test, align 4, !dbg !234, !tbaa !10
  %3 = add nsw i32 %2, 1, !dbg !234
  store i32 %3, i32* @test, align 4, !dbg !234, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !235, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !236, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !237, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !238, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !239, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !240, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !241, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !242, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !243, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !244, !tbaa !10
  %9 = load i32, i32* @RT_Buffer0, align 4, !dbg !245, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !246, !tbaa !10
  %10 = load i32, i32* @RT4_Buffer0, align 4, !dbg !247, !tbaa !10
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !248, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !249, !tbaa !10
  %12 = add nsw i32 10, %11, !dbg !250
  %13 = add nsw i32 %12, 10, !dbg !251
  %14 = add nsw i32 %13, 10, !dbg !252
  %15 = icmp sge i32 %14, 100, !dbg !253
  br i1 %15, label %16, label %17, !dbg !254

16:                                               ; preds = %1
  br label %21, !dbg !255

17:                                               ; preds = %1
  %18 = icmp sle i32 %14, 5, !dbg !256
  br i1 %18, label %19, label %20, !dbg !257

19:                                               ; preds = %17
  br label %20, !dbg !258

20:                                               ; preds = %19, %17
  br label %21

21:                                               ; preds = %20, %16
  %22 = add nsw i32 10, %12, !dbg !259
  %23 = icmp sgt i32 10, %22, !dbg !260
  br i1 %23, label %24, label %25, !dbg !261

24:                                               ; preds = %21
  br label %26, !dbg !262

25:                                               ; preds = %21
  br label %26

26:                                               ; preds = %25, %24
  %.0 = phi i8 [ 1, %24 ], [ 0, %25 ], !dbg !263
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !264, !tbaa !10
  %28 = icmp sge i32 %27, 100, !dbg !265
  br i1 %28, label %29, label %35, !dbg !264

29:                                               ; preds = %26
  %30 = trunc i8 %.0 to i1, !dbg !266
  br i1 %30, label %31, label %32, !dbg !266

31:                                               ; preds = %29
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !267, !tbaa !10
  br label %34, !dbg !268

32:                                               ; preds = %29
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !269, !tbaa !10
  store i32 %33, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !270, !tbaa !10
  br label %34

34:                                               ; preds = %32, %31
  br label %37, !dbg !271

35:                                               ; preds = %26
  %36 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !272, !tbaa !10
  store i32 %36, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !273, !tbaa !10
  br label %37

37:                                               ; preds = %35, %34
  %38 = load i32, i32* @RT2_Buffer0, align 4, !dbg !274, !tbaa !10
  store i32 %38, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !275, !tbaa !10
  store i32 10, i32* @RT10, align 4, !dbg !276, !tbaa !10
  ret i8* undef, !dbg !277
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_004_001_main() #4 !dbg !278 {
  store i32 0, i32* @test, align 4, !dbg !279, !tbaa !10
  ret i32 0, !dbg !280
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake/brake1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 142, type: !8, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 145, column: 13, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 149, column: 45, scope: !7)
!15 = !DILocation(line: 149, column: 43, scope: !7)
!16 = !DILocation(line: 152, column: 44, scope: !7)
!17 = !DILocation(line: 152, column: 42, scope: !7)
!18 = !DILocation(line: 155, column: 44, scope: !7)
!19 = !DILocation(line: 155, column: 42, scope: !7)
!20 = !DILocation(line: 158, column: 44, scope: !7)
!21 = !DILocation(line: 158, column: 42, scope: !7)
!22 = !DILocation(line: 161, column: 44, scope: !7)
!23 = !DILocation(line: 161, column: 42, scope: !7)
!24 = !DILocation(line: 164, column: 14, scope: !7)
!25 = !DILocation(line: 172, column: 28, scope: !7)
!26 = !DILocation(line: 173, column: 13, scope: !7)
!27 = !DILocation(line: 172, column: 70, scope: !7)
!28 = !DILocation(line: 172, column: 26, scope: !7)
!29 = !DILocation(line: 174, column: 30, scope: !7)
!30 = !DILocation(line: 175, column: 13, scope: !7)
!31 = !DILocation(line: 174, column: 72, scope: !7)
!32 = !DILocation(line: 174, column: 28, scope: !7)
!33 = !DILocation(line: 176, column: 30, scope: !7)
!34 = !DILocation(line: 177, column: 13, scope: !7)
!35 = !DILocation(line: 176, column: 72, scope: !7)
!36 = !DILocation(line: 176, column: 28, scope: !7)
!37 = !DILocation(line: 191, column: 16, scope: !7)
!38 = !DILocation(line: 191, column: 20, scope: !7)
!39 = !DILocation(line: 191, column: 19, scope: !7)
!40 = !DILocation(line: 191, column: 14, scope: !7)
!41 = !DILocation(line: 192, column: 16, scope: !7)
!42 = !DILocation(line: 192, column: 23, scope: !7)
!43 = !DILocation(line: 192, column: 21, scope: !7)
!44 = !DILocation(line: 192, column: 14, scope: !7)
!45 = !DILocation(line: 193, column: 16, scope: !7)
!46 = !DILocation(line: 193, column: 23, scope: !7)
!47 = !DILocation(line: 193, column: 21, scope: !7)
!48 = !DILocation(line: 193, column: 14, scope: !7)
!49 = !DILocation(line: 194, column: 16, scope: !7)
!50 = !DILocation(line: 194, column: 23, scope: !7)
!51 = !DILocation(line: 194, column: 21, scope: !7)
!52 = !DILocation(line: 194, column: 14, scope: !7)
!53 = !DILocation(line: 195, column: 16, scope: !7)
!54 = !DILocation(line: 195, column: 23, scope: !7)
!55 = !DILocation(line: 195, column: 21, scope: !7)
!56 = !DILocation(line: 195, column: 14, scope: !7)
!57 = !DILocation(line: 196, column: 16, scope: !7)
!58 = !DILocation(line: 196, column: 23, scope: !7)
!59 = !DILocation(line: 196, column: 21, scope: !7)
!60 = !DILocation(line: 196, column: 14, scope: !7)
!61 = !DILocation(line: 199, column: 13, scope: !7)
!62 = !DILocation(line: 199, column: 18, scope: !7)
!63 = !DILocation(line: 201, column: 9, scope: !7)
!64 = !DILocation(line: 203, column: 13, scope: !7)
!65 = !DILocation(line: 203, column: 18, scope: !7)
!66 = !DILocation(line: 205, column: 9, scope: !7)
!67 = !DILocation(line: 207, column: 13, scope: !7)
!68 = !DILocation(line: 207, column: 18, scope: !7)
!69 = !DILocation(line: 209, column: 9, scope: !7)
!70 = !DILocation(line: 211, column: 13, scope: !7)
!71 = !DILocation(line: 211, column: 18, scope: !7)
!72 = !DILocation(line: 213, column: 9, scope: !7)
!73 = !DILocation(line: 215, column: 13, scope: !7)
!74 = !DILocation(line: 215, column: 18, scope: !7)
!75 = !DILocation(line: 217, column: 9, scope: !7)
!76 = !DILocation(line: 219, column: 13, scope: !7)
!77 = !DILocation(line: 233, column: 22, scope: !7)
!78 = !DILocation(line: 233, column: 66, scope: !7)
!79 = !DILocation(line: 233, column: 64, scope: !7)
!80 = !DILocation(line: 233, column: 20, scope: !7)
!81 = !DILocation(line: 236, column: 23, scope: !7)
!82 = !DILocation(line: 236, column: 21, scope: !7)
!83 = !DILocation(line: 239, column: 23, scope: !7)
!84 = !DILocation(line: 239, column: 21, scope: !7)
!85 = !DILocation(line: 242, column: 23, scope: !7)
!86 = !DILocation(line: 242, column: 21, scope: !7)
!87 = !DILocation(line: 245, column: 23, scope: !7)
!88 = !DILocation(line: 245, column: 21, scope: !7)
!89 = !DILocation(line: 249, column: 1, scope: !7)
!90 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 251, type: !8, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 256, column: 13, scope: !90)
!92 = !DILocation(line: 257, column: 14, scope: !90)
!93 = !DILocation(line: 259, column: 45, scope: !90)
!94 = !DILocation(line: 259, column: 43, scope: !90)
!95 = !DILocation(line: 261, column: 44, scope: !90)
!96 = !DILocation(line: 261, column: 42, scope: !90)
!97 = !DILocation(line: 263, column: 44, scope: !90)
!98 = !DILocation(line: 263, column: 42, scope: !90)
!99 = !DILocation(line: 265, column: 44, scope: !90)
!100 = !DILocation(line: 265, column: 42, scope: !90)
!101 = !DILocation(line: 267, column: 44, scope: !90)
!102 = !DILocation(line: 267, column: 42, scope: !90)
!103 = !DILocation(line: 275, column: 45, scope: !90)
!104 = !DILocation(line: 275, column: 43, scope: !90)
!105 = !DILocation(line: 277, column: 44, scope: !90)
!106 = !DILocation(line: 277, column: 42, scope: !90)
!107 = !DILocation(line: 284, column: 66, scope: !90)
!108 = !DILocation(line: 284, column: 64, scope: !90)
!109 = !DILocation(line: 286, column: 21, scope: !90)
!110 = !DILocation(line: 287, column: 15, scope: !90)
!111 = !DILocation(line: 291, column: 15, scope: !90)
!112 = !DILocation(line: 291, column: 13, scope: !90)
!113 = !DILocation(line: 293, column: 9, scope: !90)
!114 = !DILocation(line: 295, column: 19, scope: !90)
!115 = !DILocation(line: 295, column: 17, scope: !90)
!116 = !DILocation(line: 297, column: 13, scope: !90)
!117 = !DILocation(line: 308, column: 82, scope: !90)
!118 = !DILocation(line: 309, column: 18, scope: !90)
!119 = !DILocation(line: 309, column: 13, scope: !90)
!120 = !DILocation(line: 311, column: 9, scope: !90)
!121 = !DILocation(line: 0, scope: !90)
!122 = !DILocation(line: 317, column: 13, scope: !90)
!123 = !DILocation(line: 317, column: 46, scope: !90)
!124 = !DILocation(line: 323, column: 17, scope: !90)
!125 = !DILocation(line: 324, column: 75, scope: !90)
!126 = !DILocation(line: 325, column: 13, scope: !90)
!127 = !DILocation(line: 326, column: 77, scope: !90)
!128 = !DILocation(line: 326, column: 75, scope: !90)
!129 = !DILocation(line: 329, column: 9, scope: !90)
!130 = !DILocation(line: 332, column: 73, scope: !90)
!131 = !DILocation(line: 332, column: 71, scope: !90)
!132 = !DILocation(line: 341, column: 44, scope: !90)
!133 = !DILocation(line: 341, column: 42, scope: !90)
!134 = !DILocation(line: 349, column: 13, scope: !90)
!135 = !DILocation(line: 351, column: 5, scope: !90)
!136 = distinct !DISubprogram(name: "task_FL_Wheel", scope: !1, file: !1, line: 353, type: !8, scopeLine: 353, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!137 = !DILocation(line: 354, column: 14, scope: !136)
!138 = !DILocation(line: 357, column: 45, scope: !136)
!139 = !DILocation(line: 357, column: 43, scope: !136)
!140 = !DILocation(line: 359, column: 44, scope: !136)
!141 = !DILocation(line: 359, column: 42, scope: !136)
!142 = !DILocation(line: 361, column: 44, scope: !136)
!143 = !DILocation(line: 361, column: 42, scope: !136)
!144 = !DILocation(line: 363, column: 44, scope: !136)
!145 = !DILocation(line: 363, column: 42, scope: !136)
!146 = !DILocation(line: 365, column: 44, scope: !136)
!147 = !DILocation(line: 365, column: 42, scope: !136)
!148 = !DILocation(line: 373, column: 45, scope: !136)
!149 = !DILocation(line: 373, column: 43, scope: !136)
!150 = !DILocation(line: 375, column: 40, scope: !136)
!151 = !DILocation(line: 375, column: 38, scope: !136)
!152 = !DILocation(line: 391, column: 62, scope: !136)
!153 = !DILocation(line: 391, column: 60, scope: !136)
!154 = !DILocation(line: 395, column: 17, scope: !136)
!155 = !DILocation(line: 396, column: 11, scope: !136)
!156 = !DILocation(line: 401, column: 11, scope: !136)
!157 = !DILocation(line: 401, column: 9, scope: !136)
!158 = !DILocation(line: 403, column: 5, scope: !136)
!159 = !DILocation(line: 406, column: 15, scope: !136)
!160 = !DILocation(line: 406, column: 13, scope: !136)
!161 = !DILocation(line: 408, column: 9, scope: !136)
!162 = !DILocation(line: 418, column: 78, scope: !136)
!163 = !DILocation(line: 419, column: 14, scope: !136)
!164 = !DILocation(line: 419, column: 9, scope: !136)
!165 = !DILocation(line: 421, column: 5, scope: !136)
!166 = !DILocation(line: 0, scope: !136)
!167 = !DILocation(line: 427, column: 9, scope: !136)
!168 = !DILocation(line: 427, column: 42, scope: !136)
!169 = !DILocation(line: 432, column: 13, scope: !136)
!170 = !DILocation(line: 433, column: 71, scope: !136)
!171 = !DILocation(line: 434, column: 9, scope: !136)
!172 = !DILocation(line: 435, column: 73, scope: !136)
!173 = !DILocation(line: 435, column: 71, scope: !136)
!174 = !DILocation(line: 438, column: 5, scope: !136)
!175 = !DILocation(line: 441, column: 69, scope: !136)
!176 = !DILocation(line: 441, column: 67, scope: !136)
!177 = !DILocation(line: 454, column: 9, scope: !136)
!178 = !DILocation(line: 456, column: 5, scope: !136)
!179 = !DILocation(line: 462, column: 23, scope: !136)
!180 = !DILocation(line: 462, column: 9, scope: !136)
!181 = !DILocation(line: 464, column: 5, scope: !136)
!182 = !DILocation(line: 465, column: 23, scope: !136)
!183 = !DILocation(line: 465, column: 9, scope: !136)
!184 = !DILocation(line: 467, column: 5, scope: !136)
!185 = !DILocation(line: 474, column: 12, scope: !136)
!186 = !DILocation(line: 474, column: 46, scope: !136)
!187 = !DILocation(line: 474, column: 10, scope: !136)
!188 = !DILocation(line: 476, column: 10, scope: !136)
!189 = !DILocation(line: 477, column: 1, scope: !136)
!190 = distinct !DISubprogram(name: "task_FR_Wheel", scope: !1, file: !1, line: 479, type: !8, scopeLine: 480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!191 = !DILocation(line: 481, column: 10, scope: !190)
!192 = !DILocation(line: 484, column: 41, scope: !190)
!193 = !DILocation(line: 484, column: 39, scope: !190)
!194 = !DILocation(line: 486, column: 40, scope: !190)
!195 = !DILocation(line: 486, column: 38, scope: !190)
!196 = !DILocation(line: 488, column: 40, scope: !190)
!197 = !DILocation(line: 488, column: 38, scope: !190)
!198 = !DILocation(line: 490, column: 40, scope: !190)
!199 = !DILocation(line: 490, column: 38, scope: !190)
!200 = !DILocation(line: 492, column: 40, scope: !190)
!201 = !DILocation(line: 492, column: 38, scope: !190)
!202 = !DILocation(line: 498, column: 40, scope: !190)
!203 = !DILocation(line: 498, column: 38, scope: !190)
!204 = !DILocation(line: 517, column: 66, scope: !190)
!205 = !DILocation(line: 517, column: 64, scope: !190)
!206 = !DILocation(line: 521, column: 21, scope: !190)
!207 = !DILocation(line: 522, column: 11, scope: !190)
!208 = !DILocation(line: 526, column: 11, scope: !190)
!209 = !DILocation(line: 526, column: 9, scope: !190)
!210 = !DILocation(line: 528, column: 5, scope: !190)
!211 = !DILocation(line: 531, column: 15, scope: !190)
!212 = !DILocation(line: 531, column: 13, scope: !190)
!213 = !DILocation(line: 533, column: 9, scope: !190)
!214 = !DILocation(line: 544, column: 78, scope: !190)
!215 = !DILocation(line: 545, column: 14, scope: !190)
!216 = !DILocation(line: 545, column: 9, scope: !190)
!217 = !DILocation(line: 547, column: 5, scope: !190)
!218 = !DILocation(line: 0, scope: !190)
!219 = !DILocation(line: 553, column: 9, scope: !190)
!220 = !DILocation(line: 553, column: 42, scope: !190)
!221 = !DILocation(line: 558, column: 13, scope: !190)
!222 = !DILocation(line: 559, column: 71, scope: !190)
!223 = !DILocation(line: 560, column: 9, scope: !190)
!224 = !DILocation(line: 561, column: 73, scope: !190)
!225 = !DILocation(line: 561, column: 71, scope: !190)
!226 = !DILocation(line: 564, column: 5, scope: !190)
!227 = !DILocation(line: 567, column: 69, scope: !190)
!228 = !DILocation(line: 567, column: 67, scope: !190)
!229 = !DILocation(line: 577, column: 40, scope: !190)
!230 = !DILocation(line: 577, column: 38, scope: !190)
!231 = !DILocation(line: 580, column: 10, scope: !190)
!232 = !DILocation(line: 581, column: 1, scope: !190)
!233 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !1, file: !1, line: 583, type: !8, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!234 = !DILocation(line: 585, column: 10, scope: !233)
!235 = !DILocation(line: 589, column: 41, scope: !233)
!236 = !DILocation(line: 589, column: 39, scope: !233)
!237 = !DILocation(line: 591, column: 40, scope: !233)
!238 = !DILocation(line: 591, column: 38, scope: !233)
!239 = !DILocation(line: 593, column: 40, scope: !233)
!240 = !DILocation(line: 593, column: 38, scope: !233)
!241 = !DILocation(line: 595, column: 40, scope: !233)
!242 = !DILocation(line: 595, column: 38, scope: !233)
!243 = !DILocation(line: 597, column: 40, scope: !233)
!244 = !DILocation(line: 597, column: 38, scope: !233)
!245 = !DILocation(line: 603, column: 41, scope: !233)
!246 = !DILocation(line: 603, column: 39, scope: !233)
!247 = !DILocation(line: 605, column: 40, scope: !233)
!248 = !DILocation(line: 605, column: 38, scope: !233)
!249 = !DILocation(line: 612, column: 62, scope: !233)
!250 = !DILocation(line: 612, column: 60, scope: !233)
!251 = !DILocation(line: 614, column: 17, scope: !233)
!252 = !DILocation(line: 615, column: 11, scope: !233)
!253 = !DILocation(line: 619, column: 11, scope: !233)
!254 = !DILocation(line: 619, column: 9, scope: !233)
!255 = !DILocation(line: 621, column: 5, scope: !233)
!256 = !DILocation(line: 623, column: 15, scope: !233)
!257 = !DILocation(line: 623, column: 13, scope: !233)
!258 = !DILocation(line: 625, column: 9, scope: !233)
!259 = !DILocation(line: 636, column: 78, scope: !233)
!260 = !DILocation(line: 637, column: 14, scope: !233)
!261 = !DILocation(line: 637, column: 9, scope: !233)
!262 = !DILocation(line: 639, column: 5, scope: !233)
!263 = !DILocation(line: 0, scope: !233)
!264 = !DILocation(line: 646, column: 9, scope: !233)
!265 = !DILocation(line: 646, column: 42, scope: !233)
!266 = !DILocation(line: 651, column: 13, scope: !233)
!267 = !DILocation(line: 652, column: 71, scope: !233)
!268 = !DILocation(line: 653, column: 9, scope: !233)
!269 = !DILocation(line: 654, column: 73, scope: !233)
!270 = !DILocation(line: 654, column: 71, scope: !233)
!271 = !DILocation(line: 658, column: 5, scope: !233)
!272 = !DILocation(line: 661, column: 69, scope: !233)
!273 = !DILocation(line: 661, column: 67, scope: !233)
!274 = !DILocation(line: 672, column: 40, scope: !233)
!275 = !DILocation(line: 672, column: 38, scope: !233)
!276 = !DILocation(line: 675, column: 10, scope: !233)
!277 = !DILocation(line: 676, column: 1, scope: !233)
!278 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !1, file: !1, line: 684, type: !8, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!279 = !DILocation(line: 689, column: 10, scope: !278)
!280 = !DILocation(line: 700, column: 5, scope: !278)
