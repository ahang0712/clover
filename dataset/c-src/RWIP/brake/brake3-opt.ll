; ModuleID = 'brake3-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake/brake3.c"
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
@RT4_Buffer0 = common global i32 0, align 4
@RT1_Buffer0 = common global i32 0, align 4
@RT2_Buffer0 = common global i32 0, align 4
@RT3_Buffer0 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT1_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT1 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@RT_Buffer0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT3 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Gain1_Gain = common global i32 0, align 4
@RT14 = common global i32 0, align 4
@RT12 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RT2 = common global i32 0, align 4
@RT11 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT2_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_RT3_X0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_B_local_RTH = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_Distribution_Gain0 = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_average_rpm_Gain = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_wgrads_Gain = common global i32 0, align 4
@brake_acc_nodiv_ctrl_P_vkmh_Gain = common global i32 0, align 4
@RT0_Buffer0 = common global i32 0, align 4

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
define void @task_compute() #4 !dbg !7 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !9, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !9
  store i32 %2, i32* @cnt1, align 4, !dbg !9, !tbaa !10
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !14, !tbaa !10
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !15, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !16, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !17, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !18, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !19, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !20, !tbaa !10
  %7 = add nsw i32 %5, %6, !dbg !21
  store i32 %7, i32* @Distribution_idx, align 4, !dbg !22, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !23, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !24, !tbaa !10
  %10 = add nsw i32 %8, %9, !dbg !25
  store i32 %10, i32* @Distribution_idx_0, align 4, !dbg !26, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !27, !tbaa !10
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !28, !tbaa !10
  %13 = add nsw i32 %11, %12, !dbg !29
  store i32 %13, i32* @Distribution_idx_1, align 4, !dbg !30, !tbaa !10
  %14 = load i32, i32* @RT9, align 4, !dbg !31, !tbaa !10
  %15 = load i32, i32* @RT10, align 4, !dbg !32, !tbaa !10
  %16 = add nsw i32 %14, %15, !dbg !33
  store i32 %16, i32* @vkmh, align 4, !dbg !34, !tbaa !10
  %17 = load i32, i32* @test, align 4, !dbg !35, !tbaa !10
  %18 = add nsw i32 %17, 1, !dbg !35
  store i32 %18, i32* @test, align 4, !dbg !35, !tbaa !10
  %19 = load i32, i32* @test, align 4, !dbg !36, !tbaa !10
  %20 = icmp ne i32 %19, 0, !dbg !37
  br i1 %20, label %21, label %22, !dbg !36

21:                                               ; preds = %0
  br label %22, !dbg !38

22:                                               ; preds = %21, %0
  %23 = load i32, i32* @test, align 4, !dbg !39, !tbaa !10
  %24 = icmp ne i32 %23, 1, !dbg !40
  br i1 %24, label %25, label %26, !dbg !39

25:                                               ; preds = %22
  br label %26, !dbg !41

26:                                               ; preds = %25, %22
  %27 = load i32, i32* @vkmh, align 4, !dbg !42, !tbaa !10
  store i32 %27, i32* @RT4_Buffer0, align 4, !dbg !43, !tbaa !10
  %28 = load i32, i32* @Distribution_idx, align 4, !dbg !44, !tbaa !10
  store i32 %28, i32* @RT1_Buffer0, align 4, !dbg !45, !tbaa !10
  %29 = load i32, i32* @Distribution_idx_0, align 4, !dbg !46, !tbaa !10
  store i32 %29, i32* @RT2_Buffer0, align 4, !dbg !47, !tbaa !10
  %30 = load i32, i32* @Distribution_idx_1, align 4, !dbg !48, !tbaa !10
  store i32 %30, i32* @RT3_Buffer0, align 4, !dbg !49, !tbaa !10
  ret void, !dbg !50
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #4 !dbg !51 {
  %1 = load i32, i32* @cnt2, align 4, !dbg !52, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !52
  store i32 %2, i32* @cnt2, align 4, !dbg !52, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !53, !tbaa !10
  %3 = load i32, i32* @test, align 4, !dbg !54, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !55
  br i1 %4, label %5, label %6, !dbg !54

5:                                                ; preds = %0
  br label %6, !dbg !56

6:                                                ; preds = %5, %0
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !57, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !58, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !59, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !60, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !61, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !62, !tbaa !10
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !63, !tbaa !10
  %11 = icmp sge i32 %10, 100, !dbg !64
  br i1 %11, label %12, label %17, !dbg !63

12:                                               ; preds = %6
  br i1 undef, label %13, label %14, !dbg !65

13:                                               ; preds = %12
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !66, !tbaa !10
  br label %16, !dbg !67

14:                                               ; preds = %12
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !68, !tbaa !10
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !69, !tbaa !10
  br label %16

16:                                               ; preds = %14, %13
  br label %19, !dbg !70

17:                                               ; preds = %6
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !71, !tbaa !10
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !72, !tbaa !10
  br label %19

19:                                               ; preds = %17, %16
  %20 = load i32, i32* @RT1_Buffer0, align 4, !dbg !73, !tbaa !10
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !74, !tbaa !10
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #4 !dbg !76 {
  %1 = load i32, i32* @cnt3, align 4, !dbg !77, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !77
  store i32 %2, i32* @cnt3, align 4, !dbg !77, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !78, !tbaa !10
  %3 = load i32, i32* @test, align 4, !dbg !79, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !80
  br i1 %4, label %5, label %6, !dbg !79

5:                                                ; preds = %0
  br label %6, !dbg !81

6:                                                ; preds = %5, %0
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !82, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !83, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !84, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !85, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !86, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !87, !tbaa !10
  %10 = load i32, i32* @RT_Buffer0, align 4, !dbg !88, !tbaa !10
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !89, !tbaa !10
  %11 = load i32, i32* @RT4_Buffer0, align 4, !dbg !90, !tbaa !10
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !91, !tbaa !10
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !92, !tbaa !10
  %13 = icmp sge i32 %12, 100, !dbg !93
  br i1 %13, label %14, label %19, !dbg !92

14:                                               ; preds = %6
  br i1 undef, label %15, label %16, !dbg !94

15:                                               ; preds = %14
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !95, !tbaa !10
  br label %18, !dbg !96

16:                                               ; preds = %14
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !97, !tbaa !10
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !98, !tbaa !10
  br label %18

18:                                               ; preds = %16, %15
  br label %21, !dbg !99

19:                                               ; preds = %6
  %20 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !100, !tbaa !10
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !101, !tbaa !10
  br label %21

21:                                               ; preds = %19, %18
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !102, !tbaa !10
  %23 = add nsw i32 %22, 50, !dbg !103
  store i32 %23, i32* @RT14, align 4, !dbg !104, !tbaa !10
  store i32 10, i32* @RT12, align 4, !dbg !105, !tbaa !10
  ret void, !dbg !106
}

; Function Attrs: nounwind uwtable
define void @task_isr_3() #4 !dbg !107 {
  %1 = load i32, i32* @cnt4, align 4, !dbg !108, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !108
  store i32 %2, i32* @cnt4, align 4, !dbg !108, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !109, !tbaa !10
  %3 = load i32, i32* @test, align 4, !dbg !110, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !111
  br i1 %4, label %5, label %6, !dbg !110

5:                                                ; preds = %0
  br label %6, !dbg !112

6:                                                ; preds = %5, %0
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !113, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !114, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !115, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !116, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !117, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !118, !tbaa !10
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !119, !tbaa !10
  %11 = icmp sge i32 %10, 100, !dbg !120
  br i1 %11, label %12, label %17, !dbg !119

12:                                               ; preds = %6
  br i1 undef, label %13, label %14, !dbg !121

13:                                               ; preds = %12
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !122, !tbaa !10
  br label %16, !dbg !123

14:                                               ; preds = %12
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !124, !tbaa !10
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !125, !tbaa !10
  br label %16

16:                                               ; preds = %14, %13
  br label %19, !dbg !126

17:                                               ; preds = %6
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !127, !tbaa !10
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !128, !tbaa !10
  br label %19

19:                                               ; preds = %17, %16
  %20 = load i32, i32* @RT3_Buffer0, align 4, !dbg !129, !tbaa !10
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !130, !tbaa !10
  store i32 undef, i32* @RT11, align 4, !dbg !131, !tbaa !10
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define i8* @task_RL_Wheel(i8* %0) #4 !dbg !133 {
  %2 = load i32, i32* @test, align 4, !dbg !134, !tbaa !10
  %3 = add nsw i32 %2, 1, !dbg !134
  store i32 %3, i32* @test, align 4, !dbg !134, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !135, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !136, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !137, !tbaa !10
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !138, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !139, !tbaa !10
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !140, !tbaa !10
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !141, !tbaa !10
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !142, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !143, !tbaa !10
  store i32 %8, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !144, !tbaa !10
  %9 = load i32, i32* @RT_Buffer0, align 4, !dbg !145, !tbaa !10
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !146, !tbaa !10
  %10 = load i32, i32* @RT4_Buffer0, align 4, !dbg !147, !tbaa !10
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !148, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !149, !tbaa !10
  %12 = add nsw i32 10, %11, !dbg !150
  %13 = add nsw i32 %12, 10, !dbg !151
  %14 = add nsw i32 %13, 10, !dbg !152
  %15 = icmp sge i32 %14, 100, !dbg !153
  br i1 %15, label %16, label %17, !dbg !154

16:                                               ; preds = %1
  br label %21, !dbg !155

17:                                               ; preds = %1
  %18 = icmp sle i32 %14, 5, !dbg !156
  br i1 %18, label %19, label %20, !dbg !157

19:                                               ; preds = %17
  br label %20, !dbg !158

20:                                               ; preds = %19, %17
  br label %21

21:                                               ; preds = %20, %16
  %22 = add nsw i32 10, %12, !dbg !159
  %23 = icmp sgt i32 10, %22, !dbg !160
  br i1 %23, label %24, label %25, !dbg !161

24:                                               ; preds = %21
  br label %26, !dbg !162

25:                                               ; preds = %21
  br label %26

26:                                               ; preds = %25, %24
  %.0 = phi i8 [ 1, %24 ], [ 0, %25 ], !dbg !163
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !164, !tbaa !10
  %28 = icmp sge i32 %27, 100, !dbg !165
  br i1 %28, label %29, label %35, !dbg !164

29:                                               ; preds = %26
  %30 = trunc i8 %.0 to i1, !dbg !166
  br i1 %30, label %31, label %32, !dbg !166

31:                                               ; preds = %29
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !167, !tbaa !10
  br label %34, !dbg !168

32:                                               ; preds = %29
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !169, !tbaa !10
  store i32 %33, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !170, !tbaa !10
  br label %34

34:                                               ; preds = %32, %31
  br label %37, !dbg !171

35:                                               ; preds = %26
  %36 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !172, !tbaa !10
  store i32 %36, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !173, !tbaa !10
  br label %37

37:                                               ; preds = %35, %34
  %38 = load i32, i32* @RT2_Buffer0, align 4, !dbg !174, !tbaa !10
  store i32 %38, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !175, !tbaa !10
  store i32 10, i32* @RT10, align 4, !dbg !176, !tbaa !10
  ret i8* undef, !dbg !177
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_006_001_main() #4 !dbg !178 {
  store i32 0, i32* @test, align 4, !dbg !179, !tbaa !10
  %1 = load i32, i32* @cnt1, align 4, !dbg !180, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !180
  store i32 %2, i32* @cnt1, align 4, !dbg !180, !tbaa !10
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !182, !tbaa !10
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !183, !tbaa !10
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !184, !tbaa !10
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !185, !tbaa !10
  store i32 0, i32* @test, align 4, !dbg !186, !tbaa !10
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !187, !tbaa !10
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !188, !tbaa !10
  %7 = add nsw i32 %5, %6, !dbg !189
  store i32 %7, i32* @Distribution_idx, align 4, !dbg !190, !tbaa !10
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !191, !tbaa !10
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !192, !tbaa !10
  %10 = add nsw i32 %8, %9, !dbg !193
  store i32 %10, i32* @Distribution_idx_0, align 4, !dbg !194, !tbaa !10
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !195, !tbaa !10
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !196, !tbaa !10
  %13 = add nsw i32 %11, %12, !dbg !197
  store i32 %13, i32* @Distribution_idx_1, align 4, !dbg !198, !tbaa !10
  %14 = load i32, i32* @RT9, align 4, !dbg !199, !tbaa !10
  %15 = load i32, i32* @RT10, align 4, !dbg !200, !tbaa !10
  %16 = add nsw i32 %14, %15, !dbg !201
  store i32 %16, i32* @vkmh, align 4, !dbg !202, !tbaa !10
  %17 = load i32, i32* @test, align 4, !dbg !203, !tbaa !10
  %18 = add nsw i32 %17, 1, !dbg !203
  store i32 %18, i32* @test, align 4, !dbg !203, !tbaa !10
  %19 = load i32, i32* @test, align 4, !dbg !204, !tbaa !10
  %20 = icmp ne i32 %19, 0, !dbg !205
  br i1 %20, label %21, label %22, !dbg !204

21:                                               ; preds = %0
  br label %22, !dbg !206

22:                                               ; preds = %21, %0
  %23 = load i32, i32* @test, align 4, !dbg !207, !tbaa !10
  %24 = icmp ne i32 %23, 1, !dbg !208
  br i1 %24, label %25, label %task_compute.exit, !dbg !207

25:                                               ; preds = %22
  br label %task_compute.exit, !dbg !209

task_compute.exit:                                ; preds = %22, %25
  %26 = load i32, i32* @vkmh, align 4, !dbg !210, !tbaa !10
  store i32 %26, i32* @RT4_Buffer0, align 4, !dbg !211, !tbaa !10
  %27 = load i32, i32* @Distribution_idx, align 4, !dbg !212, !tbaa !10
  store i32 %27, i32* @RT1_Buffer0, align 4, !dbg !213, !tbaa !10
  %28 = load i32, i32* @Distribution_idx_0, align 4, !dbg !214, !tbaa !10
  store i32 %28, i32* @RT2_Buffer0, align 4, !dbg !215, !tbaa !10
  %29 = load i32, i32* @Distribution_idx_1, align 4, !dbg !216, !tbaa !10
  store i32 %29, i32* @RT3_Buffer0, align 4, !dbg !217, !tbaa !10
  ret i32 0, !dbg !218
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
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake/brake3.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "task_compute", scope: !1, file: !1, line: 226, type: !8, scopeLine: 226, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 231, column: 14, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 235, column: 41, scope: !7)
!15 = !DILocation(line: 235, column: 39, scope: !7)
!16 = !DILocation(line: 238, column: 40, scope: !7)
!17 = !DILocation(line: 238, column: 38, scope: !7)
!18 = !DILocation(line: 250, column: 10, scope: !7)
!19 = !DILocation(line: 258, column: 24, scope: !7)
!20 = !DILocation(line: 259, column: 9, scope: !7)
!21 = !DILocation(line: 258, column: 66, scope: !7)
!22 = !DILocation(line: 258, column: 22, scope: !7)
!23 = !DILocation(line: 260, column: 26, scope: !7)
!24 = !DILocation(line: 261, column: 9, scope: !7)
!25 = !DILocation(line: 260, column: 68, scope: !7)
!26 = !DILocation(line: 260, column: 24, scope: !7)
!27 = !DILocation(line: 262, column: 26, scope: !7)
!28 = !DILocation(line: 263, column: 9, scope: !7)
!29 = !DILocation(line: 262, column: 68, scope: !7)
!30 = !DILocation(line: 262, column: 24, scope: !7)
!31 = !DILocation(line: 277, column: 12, scope: !7)
!32 = !DILocation(line: 277, column: 16, scope: !7)
!33 = !DILocation(line: 277, column: 15, scope: !7)
!34 = !DILocation(line: 277, column: 10, scope: !7)
!35 = !DILocation(line: 285, column: 9, scope: !7)
!36 = !DILocation(line: 288, column: 9, scope: !7)
!37 = !DILocation(line: 288, column: 14, scope: !7)
!38 = !DILocation(line: 290, column: 5, scope: !7)
!39 = !DILocation(line: 293, column: 9, scope: !7)
!40 = !DILocation(line: 293, column: 14, scope: !7)
!41 = !DILocation(line: 295, column: 5, scope: !7)
!42 = !DILocation(line: 311, column: 19, scope: !7)
!43 = !DILocation(line: 311, column: 17, scope: !7)
!44 = !DILocation(line: 314, column: 19, scope: !7)
!45 = !DILocation(line: 314, column: 17, scope: !7)
!46 = !DILocation(line: 317, column: 19, scope: !7)
!47 = !DILocation(line: 317, column: 17, scope: !7)
!48 = !DILocation(line: 320, column: 19, scope: !7)
!49 = !DILocation(line: 320, column: 17, scope: !7)
!50 = !DILocation(line: 323, column: 1, scope: !7)
!51 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 325, type: !8, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 330, column: 14, scope: !51)
!53 = !DILocation(line: 331, column: 10, scope: !51)
!54 = !DILocation(line: 334, column: 9, scope: !51)
!55 = !DILocation(line: 334, column: 14, scope: !51)
!56 = !DILocation(line: 336, column: 5, scope: !51)
!57 = !DILocation(line: 339, column: 41, scope: !51)
!58 = !DILocation(line: 339, column: 39, scope: !51)
!59 = !DILocation(line: 341, column: 40, scope: !51)
!60 = !DILocation(line: 341, column: 38, scope: !51)
!61 = !DILocation(line: 343, column: 40, scope: !51)
!62 = !DILocation(line: 343, column: 38, scope: !51)
!63 = !DILocation(line: 397, column: 9, scope: !51)
!64 = !DILocation(line: 397, column: 42, scope: !51)
!65 = !DILocation(line: 403, column: 13, scope: !51)
!66 = !DILocation(line: 404, column: 71, scope: !51)
!67 = !DILocation(line: 405, column: 9, scope: !51)
!68 = !DILocation(line: 406, column: 73, scope: !51)
!69 = !DILocation(line: 406, column: 71, scope: !51)
!70 = !DILocation(line: 409, column: 5, scope: !51)
!71 = !DILocation(line: 412, column: 69, scope: !51)
!72 = !DILocation(line: 412, column: 67, scope: !51)
!73 = !DILocation(line: 421, column: 40, scope: !51)
!74 = !DILocation(line: 421, column: 38, scope: !51)
!75 = !DILocation(line: 430, column: 1, scope: !51)
!76 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 432, type: !8, scopeLine: 432, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 438, column: 13, scope: !76)
!78 = !DILocation(line: 439, column: 10, scope: !76)
!79 = !DILocation(line: 442, column: 9, scope: !76)
!80 = !DILocation(line: 442, column: 14, scope: !76)
!81 = !DILocation(line: 444, column: 5, scope: !76)
!82 = !DILocation(line: 448, column: 41, scope: !76)
!83 = !DILocation(line: 448, column: 39, scope: !76)
!84 = !DILocation(line: 450, column: 40, scope: !76)
!85 = !DILocation(line: 450, column: 38, scope: !76)
!86 = !DILocation(line: 452, column: 40, scope: !76)
!87 = !DILocation(line: 452, column: 38, scope: !76)
!88 = !DILocation(line: 464, column: 45, scope: !76)
!89 = !DILocation(line: 464, column: 43, scope: !76)
!90 = !DILocation(line: 466, column: 40, scope: !76)
!91 = !DILocation(line: 466, column: 38, scope: !76)
!92 = !DILocation(line: 518, column: 9, scope: !76)
!93 = !DILocation(line: 518, column: 42, scope: !76)
!94 = !DILocation(line: 523, column: 13, scope: !76)
!95 = !DILocation(line: 524, column: 71, scope: !76)
!96 = !DILocation(line: 525, column: 9, scope: !76)
!97 = !DILocation(line: 526, column: 73, scope: !76)
!98 = !DILocation(line: 526, column: 71, scope: !76)
!99 = !DILocation(line: 529, column: 5, scope: !76)
!100 = !DILocation(line: 532, column: 69, scope: !76)
!101 = !DILocation(line: 532, column: 67, scope: !76)
!102 = !DILocation(line: 565, column: 12, scope: !76)
!103 = !DILocation(line: 565, column: 46, scope: !76)
!104 = !DILocation(line: 565, column: 10, scope: !76)
!105 = !DILocation(line: 567, column: 10, scope: !76)
!106 = !DILocation(line: 569, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 571, type: !8, scopeLine: 572, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 574, column: 13, scope: !107)
!109 = !DILocation(line: 575, column: 10, scope: !107)
!110 = !DILocation(line: 578, column: 9, scope: !107)
!111 = !DILocation(line: 578, column: 14, scope: !107)
!112 = !DILocation(line: 580, column: 5, scope: !107)
!113 = !DILocation(line: 584, column: 41, scope: !107)
!114 = !DILocation(line: 584, column: 39, scope: !107)
!115 = !DILocation(line: 586, column: 40, scope: !107)
!116 = !DILocation(line: 586, column: 38, scope: !107)
!117 = !DILocation(line: 588, column: 40, scope: !107)
!118 = !DILocation(line: 588, column: 38, scope: !107)
!119 = !DILocation(line: 653, column: 9, scope: !107)
!120 = !DILocation(line: 653, column: 42, scope: !107)
!121 = !DILocation(line: 658, column: 13, scope: !107)
!122 = !DILocation(line: 659, column: 71, scope: !107)
!123 = !DILocation(line: 660, column: 9, scope: !107)
!124 = !DILocation(line: 661, column: 73, scope: !107)
!125 = !DILocation(line: 661, column: 71, scope: !107)
!126 = !DILocation(line: 664, column: 5, scope: !107)
!127 = !DILocation(line: 667, column: 69, scope: !107)
!128 = !DILocation(line: 667, column: 67, scope: !107)
!129 = !DILocation(line: 677, column: 40, scope: !107)
!130 = !DILocation(line: 677, column: 38, scope: !107)
!131 = !DILocation(line: 680, column: 10, scope: !107)
!132 = !DILocation(line: 682, column: 1, scope: !107)
!133 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !1, file: !1, line: 684, type: !8, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!134 = !DILocation(line: 686, column: 10, scope: !133)
!135 = !DILocation(line: 690, column: 41, scope: !133)
!136 = !DILocation(line: 690, column: 39, scope: !133)
!137 = !DILocation(line: 692, column: 40, scope: !133)
!138 = !DILocation(line: 692, column: 38, scope: !133)
!139 = !DILocation(line: 694, column: 40, scope: !133)
!140 = !DILocation(line: 694, column: 38, scope: !133)
!141 = !DILocation(line: 696, column: 40, scope: !133)
!142 = !DILocation(line: 696, column: 38, scope: !133)
!143 = !DILocation(line: 698, column: 40, scope: !133)
!144 = !DILocation(line: 698, column: 38, scope: !133)
!145 = !DILocation(line: 704, column: 41, scope: !133)
!146 = !DILocation(line: 704, column: 39, scope: !133)
!147 = !DILocation(line: 706, column: 40, scope: !133)
!148 = !DILocation(line: 706, column: 38, scope: !133)
!149 = !DILocation(line: 713, column: 62, scope: !133)
!150 = !DILocation(line: 713, column: 60, scope: !133)
!151 = !DILocation(line: 715, column: 17, scope: !133)
!152 = !DILocation(line: 716, column: 11, scope: !133)
!153 = !DILocation(line: 720, column: 11, scope: !133)
!154 = !DILocation(line: 720, column: 9, scope: !133)
!155 = !DILocation(line: 722, column: 5, scope: !133)
!156 = !DILocation(line: 724, column: 15, scope: !133)
!157 = !DILocation(line: 724, column: 13, scope: !133)
!158 = !DILocation(line: 726, column: 9, scope: !133)
!159 = !DILocation(line: 737, column: 78, scope: !133)
!160 = !DILocation(line: 738, column: 14, scope: !133)
!161 = !DILocation(line: 738, column: 9, scope: !133)
!162 = !DILocation(line: 740, column: 5, scope: !133)
!163 = !DILocation(line: 0, scope: !133)
!164 = !DILocation(line: 747, column: 9, scope: !133)
!165 = !DILocation(line: 747, column: 42, scope: !133)
!166 = !DILocation(line: 752, column: 13, scope: !133)
!167 = !DILocation(line: 753, column: 71, scope: !133)
!168 = !DILocation(line: 754, column: 9, scope: !133)
!169 = !DILocation(line: 755, column: 73, scope: !133)
!170 = !DILocation(line: 755, column: 71, scope: !133)
!171 = !DILocation(line: 759, column: 5, scope: !133)
!172 = !DILocation(line: 762, column: 69, scope: !133)
!173 = !DILocation(line: 762, column: 67, scope: !133)
!174 = !DILocation(line: 773, column: 40, scope: !133)
!175 = !DILocation(line: 773, column: 38, scope: !133)
!176 = !DILocation(line: 776, column: 10, scope: !133)
!177 = !DILocation(line: 777, column: 1, scope: !133)
!178 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !1, file: !1, line: 785, type: !8, scopeLine: 786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!179 = !DILocation(line: 789, column: 10, scope: !178)
!180 = !DILocation(line: 231, column: 14, scope: !7, inlinedAt: !181)
!181 = distinct !DILocation(line: 792, column: 5, scope: !178)
!182 = !DILocation(line: 235, column: 41, scope: !7, inlinedAt: !181)
!183 = !DILocation(line: 235, column: 39, scope: !7, inlinedAt: !181)
!184 = !DILocation(line: 238, column: 40, scope: !7, inlinedAt: !181)
!185 = !DILocation(line: 238, column: 38, scope: !7, inlinedAt: !181)
!186 = !DILocation(line: 250, column: 10, scope: !7, inlinedAt: !181)
!187 = !DILocation(line: 258, column: 24, scope: !7, inlinedAt: !181)
!188 = !DILocation(line: 259, column: 9, scope: !7, inlinedAt: !181)
!189 = !DILocation(line: 258, column: 66, scope: !7, inlinedAt: !181)
!190 = !DILocation(line: 258, column: 22, scope: !7, inlinedAt: !181)
!191 = !DILocation(line: 260, column: 26, scope: !7, inlinedAt: !181)
!192 = !DILocation(line: 261, column: 9, scope: !7, inlinedAt: !181)
!193 = !DILocation(line: 260, column: 68, scope: !7, inlinedAt: !181)
!194 = !DILocation(line: 260, column: 24, scope: !7, inlinedAt: !181)
!195 = !DILocation(line: 262, column: 26, scope: !7, inlinedAt: !181)
!196 = !DILocation(line: 263, column: 9, scope: !7, inlinedAt: !181)
!197 = !DILocation(line: 262, column: 68, scope: !7, inlinedAt: !181)
!198 = !DILocation(line: 262, column: 24, scope: !7, inlinedAt: !181)
!199 = !DILocation(line: 277, column: 12, scope: !7, inlinedAt: !181)
!200 = !DILocation(line: 277, column: 16, scope: !7, inlinedAt: !181)
!201 = !DILocation(line: 277, column: 15, scope: !7, inlinedAt: !181)
!202 = !DILocation(line: 277, column: 10, scope: !7, inlinedAt: !181)
!203 = !DILocation(line: 285, column: 9, scope: !7, inlinedAt: !181)
!204 = !DILocation(line: 288, column: 9, scope: !7, inlinedAt: !181)
!205 = !DILocation(line: 288, column: 14, scope: !7, inlinedAt: !181)
!206 = !DILocation(line: 290, column: 5, scope: !7, inlinedAt: !181)
!207 = !DILocation(line: 293, column: 9, scope: !7, inlinedAt: !181)
!208 = !DILocation(line: 293, column: 14, scope: !7, inlinedAt: !181)
!209 = !DILocation(line: 295, column: 5, scope: !7, inlinedAt: !181)
!210 = !DILocation(line: 311, column: 19, scope: !7, inlinedAt: !181)
!211 = !DILocation(line: 311, column: 17, scope: !7, inlinedAt: !181)
!212 = !DILocation(line: 314, column: 19, scope: !7, inlinedAt: !181)
!213 = !DILocation(line: 314, column: 17, scope: !7, inlinedAt: !181)
!214 = !DILocation(line: 317, column: 19, scope: !7, inlinedAt: !181)
!215 = !DILocation(line: 317, column: 17, scope: !7, inlinedAt: !181)
!216 = !DILocation(line: 320, column: 19, scope: !7, inlinedAt: !181)
!217 = !DILocation(line: 320, column: 17, scope: !7, inlinedAt: !181)
!218 = !DILocation(line: 801, column: 5, scope: !178)
