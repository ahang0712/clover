; ModuleID = 'brake3.bc'
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

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @vprintf(i8* noalias %0, %struct.__va_list_tag* %1) #0 !dbg !7 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.__va_list_tag*, align 8
  store i8* %0, i8** %3, align 8, !tbaa !10
  store %struct.__va_list_tag* %1, %struct.__va_list_tag** %4, align 8, !tbaa !10
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !14, !tbaa !10
  %6 = load i8*, i8** %3, align 8, !dbg !15, !tbaa !10
  %7 = load %struct.__va_list_tag*, %struct.__va_list_tag** %4, align 8, !dbg !16, !tbaa !10
  %8 = call i32 @vfprintf(%struct._IO_FILE* %5, i8* %6, %struct.__va_list_tag* %7), !dbg !17
  ret i32 %8, !dbg !18
}

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #1

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @getchar() #0 !dbg !19 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !20, !tbaa !10
  %2 = call i32 @_IO_getc(%struct._IO_FILE* %1), !dbg !21
  ret i32 %2, !dbg !22
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @fgetc_unlocked(%struct._IO_FILE* %0) #0 !dbg !23 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8, !tbaa !10
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !24, !tbaa !10
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i32 0, i32 1, !dbg !24
  %5 = load i8*, i8** %4, align 8, !dbg !24, !tbaa !25
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !24, !tbaa !10
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i32 0, i32 2, !dbg !24
  %8 = load i8*, i8** %7, align 8, !dbg !24, !tbaa !30
  %9 = icmp uge i8* %5, %8, !dbg !24
  %10 = zext i1 %9 to i32, !dbg !24
  %11 = sext i32 %10 to i64, !dbg !24
  %12 = call i64 @llvm.expect.i64(i64 %11, i64 0), !dbg !24
  %13 = icmp ne i64 %12, 0, !dbg !24
  br i1 %13, label %14, label %17, !dbg !24

14:                                               ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !24, !tbaa !10
  %16 = call i32 @__uflow(%struct._IO_FILE* %15), !dbg !24
  br label %24, !dbg !24

17:                                               ; preds = %1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !24, !tbaa !10
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %18, i32 0, i32 1, !dbg !24
  %20 = load i8*, i8** %19, align 8, !dbg !24, !tbaa !25
  %21 = getelementptr inbounds i8, i8* %20, i32 1, !dbg !24
  store i8* %21, i8** %19, align 8, !dbg !24, !tbaa !25
  %22 = load i8, i8* %20, align 1, !dbg !24, !tbaa !31
  %23 = zext i8 %22 to i32, !dbg !24
  br label %24, !dbg !24

24:                                               ; preds = %17, %14
  %25 = phi i32 [ %16, %14 ], [ %23, %17 ], !dbg !24
  ret i32 %25, !dbg !32
}

; Function Attrs: nounwind readnone willreturn
declare i64 @llvm.expect.i64(i64, i64) #2

declare i32 @__uflow(%struct._IO_FILE*) #1

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @getc_unlocked(%struct._IO_FILE* %0) #0 !dbg !33 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8, !tbaa !10
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !34, !tbaa !10
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i32 0, i32 1, !dbg !34
  %5 = load i8*, i8** %4, align 8, !dbg !34, !tbaa !25
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !34, !tbaa !10
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i32 0, i32 2, !dbg !34
  %8 = load i8*, i8** %7, align 8, !dbg !34, !tbaa !30
  %9 = icmp uge i8* %5, %8, !dbg !34
  %10 = zext i1 %9 to i32, !dbg !34
  %11 = sext i32 %10 to i64, !dbg !34
  %12 = call i64 @llvm.expect.i64(i64 %11, i64 0), !dbg !34
  %13 = icmp ne i64 %12, 0, !dbg !34
  br i1 %13, label %14, label %17, !dbg !34

14:                                               ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !34, !tbaa !10
  %16 = call i32 @__uflow(%struct._IO_FILE* %15), !dbg !34
  br label %24, !dbg !34

17:                                               ; preds = %1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !34, !tbaa !10
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %18, i32 0, i32 1, !dbg !34
  %20 = load i8*, i8** %19, align 8, !dbg !34, !tbaa !25
  %21 = getelementptr inbounds i8, i8* %20, i32 1, !dbg !34
  store i8* %21, i8** %19, align 8, !dbg !34, !tbaa !25
  %22 = load i8, i8* %20, align 1, !dbg !34, !tbaa !31
  %23 = zext i8 %22 to i32, !dbg !34
  br label %24, !dbg !34

24:                                               ; preds = %17, %14
  %25 = phi i32 [ %16, %14 ], [ %23, %17 ], !dbg !34
  ret i32 %25, !dbg !35
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @getchar_unlocked() #0 !dbg !36 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37, !tbaa !10
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i32 0, i32 1, !dbg !37
  %3 = load i8*, i8** %2, align 8, !dbg !37, !tbaa !25
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37, !tbaa !10
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i32 0, i32 2, !dbg !37
  %6 = load i8*, i8** %5, align 8, !dbg !37, !tbaa !30
  %7 = icmp uge i8* %3, %6, !dbg !37
  %8 = zext i1 %7 to i32, !dbg !37
  %9 = sext i32 %8 to i64, !dbg !37
  %10 = call i64 @llvm.expect.i64(i64 %9, i64 0), !dbg !37
  %11 = icmp ne i64 %10, 0, !dbg !37
  br i1 %11, label %12, label %15, !dbg !37

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37, !tbaa !10
  %14 = call i32 @__uflow(%struct._IO_FILE* %13), !dbg !37
  br label %22, !dbg !37

15:                                               ; preds = %0
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !37, !tbaa !10
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %16, i32 0, i32 1, !dbg !37
  %18 = load i8*, i8** %17, align 8, !dbg !37, !tbaa !25
  %19 = getelementptr inbounds i8, i8* %18, i32 1, !dbg !37
  store i8* %19, i8** %17, align 8, !dbg !37, !tbaa !25
  %20 = load i8, i8* %18, align 1, !dbg !37, !tbaa !31
  %21 = zext i8 %20 to i32, !dbg !37
  br label %22, !dbg !37

22:                                               ; preds = %15, %12
  %23 = phi i32 [ %14, %12 ], [ %21, %15 ], !dbg !37
  ret i32 %23, !dbg !38
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putchar(i32 %0) #0 !dbg !39 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !40
  %3 = load i32, i32* %2, align 4, !dbg !41, !tbaa !40
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !42, !tbaa !10
  %5 = call i32 @_IO_putc(i32 %3, %struct._IO_FILE* %4), !dbg !43
  ret i32 %5, !dbg !44
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @fputc_unlocked(i32 %0, %struct._IO_FILE* %1) #0 !dbg !45 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  store i32 %0, i32* %3, align 4, !tbaa !40
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8, !tbaa !10
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !46, !tbaa !10
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i32 0, i32 5, !dbg !46
  %7 = load i8*, i8** %6, align 8, !dbg !46, !tbaa !47
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !46, !tbaa !10
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i32 0, i32 6, !dbg !46
  %10 = load i8*, i8** %9, align 8, !dbg !46, !tbaa !48
  %11 = icmp uge i8* %7, %10, !dbg !46
  %12 = zext i1 %11 to i32, !dbg !46
  %13 = sext i32 %12 to i64, !dbg !46
  %14 = call i64 @llvm.expect.i64(i64 %13, i64 0), !dbg !46
  %15 = icmp ne i64 %14, 0, !dbg !46
  br i1 %15, label %16, label %22, !dbg !46

16:                                               ; preds = %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !46, !tbaa !10
  %18 = load i32, i32* %3, align 4, !dbg !46, !tbaa !40
  %19 = trunc i32 %18 to i8, !dbg !46
  %20 = zext i8 %19 to i32, !dbg !46
  %21 = call i32 @__overflow(%struct._IO_FILE* %17, i32 %20), !dbg !46
  br label %30, !dbg !46

22:                                               ; preds = %2
  %23 = load i32, i32* %3, align 4, !dbg !46, !tbaa !40
  %24 = trunc i32 %23 to i8, !dbg !46
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !46, !tbaa !10
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %25, i32 0, i32 5, !dbg !46
  %27 = load i8*, i8** %26, align 8, !dbg !46, !tbaa !47
  %28 = getelementptr inbounds i8, i8* %27, i32 1, !dbg !46
  store i8* %28, i8** %26, align 8, !dbg !46, !tbaa !47
  store i8 %24, i8* %27, align 1, !dbg !46, !tbaa !31
  %29 = zext i8 %24 to i32, !dbg !46
  br label %30, !dbg !46

30:                                               ; preds = %22, %16
  %31 = phi i32 [ %21, %16 ], [ %29, %22 ], !dbg !46
  ret i32 %31, !dbg !49
}

declare i32 @__overflow(%struct._IO_FILE*, i32) #1

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putc_unlocked(i32 %0, %struct._IO_FILE* %1) #0 !dbg !50 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  store i32 %0, i32* %3, align 4, !tbaa !40
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8, !tbaa !10
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !51, !tbaa !10
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i32 0, i32 5, !dbg !51
  %7 = load i8*, i8** %6, align 8, !dbg !51, !tbaa !47
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !51, !tbaa !10
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i32 0, i32 6, !dbg !51
  %10 = load i8*, i8** %9, align 8, !dbg !51, !tbaa !48
  %11 = icmp uge i8* %7, %10, !dbg !51
  %12 = zext i1 %11 to i32, !dbg !51
  %13 = sext i32 %12 to i64, !dbg !51
  %14 = call i64 @llvm.expect.i64(i64 %13, i64 0), !dbg !51
  %15 = icmp ne i64 %14, 0, !dbg !51
  br i1 %15, label %16, label %22, !dbg !51

16:                                               ; preds = %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !51, !tbaa !10
  %18 = load i32, i32* %3, align 4, !dbg !51, !tbaa !40
  %19 = trunc i32 %18 to i8, !dbg !51
  %20 = zext i8 %19 to i32, !dbg !51
  %21 = call i32 @__overflow(%struct._IO_FILE* %17, i32 %20), !dbg !51
  br label %30, !dbg !51

22:                                               ; preds = %2
  %23 = load i32, i32* %3, align 4, !dbg !51, !tbaa !40
  %24 = trunc i32 %23 to i8, !dbg !51
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !dbg !51, !tbaa !10
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %25, i32 0, i32 5, !dbg !51
  %27 = load i8*, i8** %26, align 8, !dbg !51, !tbaa !47
  %28 = getelementptr inbounds i8, i8* %27, i32 1, !dbg !51
  store i8* %28, i8** %26, align 8, !dbg !51, !tbaa !47
  store i8 %24, i8* %27, align 1, !dbg !51, !tbaa !31
  %29 = zext i8 %24 to i32, !dbg !51
  br label %30, !dbg !51

30:                                               ; preds = %22, %16
  %31 = phi i32 [ %21, %16 ], [ %29, %22 ], !dbg !51
  ret i32 %31, !dbg !52
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @putchar_unlocked(i32 %0) #0 !dbg !53 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !40
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54, !tbaa !10
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i32 0, i32 5, !dbg !54
  %5 = load i8*, i8** %4, align 8, !dbg !54, !tbaa !47
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54, !tbaa !10
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %6, i32 0, i32 6, !dbg !54
  %8 = load i8*, i8** %7, align 8, !dbg !54, !tbaa !48
  %9 = icmp uge i8* %5, %8, !dbg !54
  %10 = zext i1 %9 to i32, !dbg !54
  %11 = sext i32 %10 to i64, !dbg !54
  %12 = call i64 @llvm.expect.i64(i64 %11, i64 0), !dbg !54
  %13 = icmp ne i64 %12, 0, !dbg !54
  br i1 %13, label %14, label %20, !dbg !54

14:                                               ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54, !tbaa !10
  %16 = load i32, i32* %2, align 4, !dbg !54, !tbaa !40
  %17 = trunc i32 %16 to i8, !dbg !54
  %18 = zext i8 %17 to i32, !dbg !54
  %19 = call i32 @__overflow(%struct._IO_FILE* %15, i32 %18), !dbg !54
  br label %28, !dbg !54

20:                                               ; preds = %1
  %21 = load i32, i32* %2, align 4, !dbg !54, !tbaa !40
  %22 = trunc i32 %21 to i8, !dbg !54
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !54, !tbaa !10
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %23, i32 0, i32 5, !dbg !54
  %25 = load i8*, i8** %24, align 8, !dbg !54, !tbaa !47
  %26 = getelementptr inbounds i8, i8* %25, i32 1, !dbg !54
  store i8* %26, i8** %24, align 8, !dbg !54, !tbaa !47
  store i8 %22, i8* %25, align 1, !dbg !54, !tbaa !31
  %27 = zext i8 %22 to i32, !dbg !54
  br label %28, !dbg !54

28:                                               ; preds = %20, %14
  %29 = phi i32 [ %19, %14 ], [ %27, %20 ], !dbg !54
  ret i32 %29, !dbg !55
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @feof_unlocked(%struct._IO_FILE* %0) #0 !dbg !56 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8, !tbaa !10
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !57, !tbaa !10
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i32 0, i32 0, !dbg !57
  %5 = load i32, i32* %4, align 8, !dbg !57, !tbaa !58
  %6 = and i32 %5, 16, !dbg !57
  %7 = icmp ne i32 %6, 0, !dbg !57
  %8 = zext i1 %7 to i32, !dbg !57
  ret i32 %8, !dbg !59
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i32 @ferror_unlocked(%struct._IO_FILE* %0) #0 !dbg !60 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8, !tbaa !10
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8, !dbg !61, !tbaa !10
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i32 0, i32 0, !dbg !61
  %5 = load i32, i32* %4, align 8, !dbg !61, !tbaa !58
  %6 = and i32 %5, 32, !dbg !61
  %7 = icmp ne i32 %6, 0, !dbg !61
  %8 = zext i1 %7 to i32, !dbg !61
  ret i32 %8, !dbg !62
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nonnull %0) #3 !dbg !63 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = load i8*, i8** %2, align 8, !dbg !65, !tbaa !10
  %4 = call i64 @strtol(i8* %3, i8** null, i32 10) #8, !dbg !66
  %5 = trunc i64 %4 to i32, !dbg !67
  ret i32 %5, !dbg !68
}

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #4

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i64 @atol(i8* nonnull %0) #3 !dbg !69 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = load i8*, i8** %2, align 8, !dbg !70, !tbaa !10
  %4 = call i64 @strtol(i8* %3, i8** null, i32 10) #8, !dbg !71
  ret i64 %4, !dbg !72
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i64 @atoll(i8* nonnull %0) #3 !dbg !73 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = load i8*, i8** %2, align 8, !dbg !74, !tbaa !10
  %4 = call i64 @strtoll(i8* %3, i8** null, i32 10) #8, !dbg !75
  ret i64 %4, !dbg !76
}

; Function Attrs: nounwind
declare i64 @strtoll(i8*, i8**, i32) #4

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i16 @__uint16_identity(i16 zeroext %0) #0 !dbg !77 {
  %2 = alloca i16, align 2
  store i16 %0, i16* %2, align 2, !tbaa !79
  %3 = load i16, i16* %2, align 2, !dbg !80, !tbaa !79
  ret i16 %3, !dbg !81
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @__uint32_identity(i32 %0) #0 !dbg !82 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !40
  %3 = load i32, i32* %2, align 4, !dbg !83, !tbaa !40
  ret i32 %3, !dbg !84
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @__uint64_identity(i64 %0) #0 !dbg !85 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8, !tbaa !86
  %3 = load i64, i64* %2, align 8, !dbg !87, !tbaa !86
  ret i64 %3, !dbg !88
}

; Function Attrs: inlinehint nounwind readnone uwtable
define available_externally i32 @gnu_dev_major(i64 %0) #5 !dbg !89 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8, !tbaa !86
  %4 = bitcast i32* %3 to i8*, !dbg !91
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #8, !dbg !91
  %5 = load i64, i64* %2, align 8, !dbg !91, !tbaa !86
  %6 = and i64 %5, 1048320, !dbg !91
  %7 = lshr i64 %6, 8, !dbg !91
  %8 = trunc i64 %7 to i32, !dbg !91
  store i32 %8, i32* %3, align 4, !dbg !91, !tbaa !40
  %9 = load i64, i64* %2, align 8, !dbg !91, !tbaa !86
  %10 = and i64 %9, -17592186044416, !dbg !91
  %11 = lshr i64 %10, 32, !dbg !91
  %12 = load i32, i32* %3, align 4, !dbg !91, !tbaa !40
  %13 = zext i32 %12 to i64, !dbg !91
  %14 = or i64 %13, %11, !dbg !91
  %15 = trunc i64 %14 to i32, !dbg !91
  store i32 %15, i32* %3, align 4, !dbg !91, !tbaa !40
  %16 = load i32, i32* %3, align 4, !dbg !91, !tbaa !40
  %17 = bitcast i32* %3 to i8*, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #8, !dbg !91
  ret i32 %16, !dbg !91
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: inlinehint nounwind readnone uwtable
define available_externally i32 @gnu_dev_minor(i64 %0) #5 !dbg !92 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8, !tbaa !86
  %4 = bitcast i32* %3 to i8*, !dbg !93
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #8, !dbg !93
  %5 = load i64, i64* %2, align 8, !dbg !93, !tbaa !86
  %6 = and i64 %5, 255, !dbg !93
  %7 = lshr i64 %6, 0, !dbg !93
  %8 = trunc i64 %7 to i32, !dbg !93
  store i32 %8, i32* %3, align 4, !dbg !93, !tbaa !40
  %9 = load i64, i64* %2, align 8, !dbg !93, !tbaa !86
  %10 = and i64 %9, 17592184995840, !dbg !93
  %11 = lshr i64 %10, 12, !dbg !93
  %12 = load i32, i32* %3, align 4, !dbg !93, !tbaa !40
  %13 = zext i32 %12 to i64, !dbg !93
  %14 = or i64 %13, %11, !dbg !93
  %15 = trunc i64 %14 to i32, !dbg !93
  store i32 %15, i32* %3, align 4, !dbg !93, !tbaa !40
  %16 = load i32, i32* %3, align 4, !dbg !93, !tbaa !40
  %17 = bitcast i32* %3 to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #8, !dbg !93
  ret i32 %16, !dbg !93
}

; Function Attrs: inlinehint nounwind readnone uwtable
define available_externally i64 @gnu_dev_makedev(i32 %0, i32 %1) #5 !dbg !94 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 %0, i32* %3, align 4, !tbaa !40
  store i32 %1, i32* %4, align 4, !tbaa !40
  %6 = bitcast i64* %5 to i8*, !dbg !95
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #8, !dbg !95
  %7 = load i32, i32* %3, align 4, !dbg !95, !tbaa !40
  %8 = and i32 %7, 4095, !dbg !95
  %9 = zext i32 %8 to i64, !dbg !95
  %10 = shl i64 %9, 8, !dbg !95
  store i64 %10, i64* %5, align 8, !dbg !95, !tbaa !86
  %11 = load i32, i32* %3, align 4, !dbg !95, !tbaa !40
  %12 = and i32 %11, -4096, !dbg !95
  %13 = zext i32 %12 to i64, !dbg !95
  %14 = shl i64 %13, 32, !dbg !95
  %15 = load i64, i64* %5, align 8, !dbg !95, !tbaa !86
  %16 = or i64 %15, %14, !dbg !95
  store i64 %16, i64* %5, align 8, !dbg !95, !tbaa !86
  %17 = load i32, i32* %4, align 4, !dbg !95, !tbaa !40
  %18 = and i32 %17, 255, !dbg !95
  %19 = zext i32 %18 to i64, !dbg !95
  %20 = shl i64 %19, 0, !dbg !95
  %21 = load i64, i64* %5, align 8, !dbg !95, !tbaa !86
  %22 = or i64 %21, %20, !dbg !95
  store i64 %22, i64* %5, align 8, !dbg !95, !tbaa !86
  %23 = load i32, i32* %4, align 4, !dbg !95, !tbaa !40
  %24 = and i32 %23, -256, !dbg !95
  %25 = zext i32 %24 to i64, !dbg !95
  %26 = shl i64 %25, 12, !dbg !95
  %27 = load i64, i64* %5, align 8, !dbg !95, !tbaa !86
  %28 = or i64 %27, %26, !dbg !95
  store i64 %28, i64* %5, align 8, !dbg !95, !tbaa !86
  %29 = load i64, i64* %5, align 8, !dbg !95, !tbaa !86
  %30 = bitcast i64* %5 to i8*, !dbg !95
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #8, !dbg !95
  ret i64 %29, !dbg !95
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally i8* @bsearch(i8* nonnull %0, i8* nonnull %1, i64 %2, i64 %3, i32 (i8*, i8*)* nonnull %4) #0 !dbg !96 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32 (i8*, i8*)*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32
  store i8* %0, i8** %7, align 8, !tbaa !10
  store i8* %1, i8** %8, align 8, !tbaa !10
  store i64 %2, i64* %9, align 8, !tbaa !86
  store i64 %3, i64* %10, align 8, !tbaa !86
  store i32 (i8*, i8*)* %4, i32 (i8*, i8*)** %11, align 8, !tbaa !10
  %18 = bitcast i64* %12 to i8*, !dbg !98
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %18) #8, !dbg !98
  %19 = bitcast i64* %13 to i8*, !dbg !98
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %19) #8, !dbg !98
  %20 = bitcast i64* %14 to i8*, !dbg !98
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %20) #8, !dbg !98
  %21 = bitcast i8** %15 to i8*, !dbg !99
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21) #8, !dbg !99
  %22 = bitcast i32* %16 to i8*, !dbg !100
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %22) #8, !dbg !100
  store i64 0, i64* %12, align 8, !dbg !101, !tbaa !86
  %23 = load i64, i64* %9, align 8, !dbg !102, !tbaa !86
  store i64 %23, i64* %13, align 8, !dbg !103, !tbaa !86
  br label %24, !dbg !104

24:                                               ; preds = %55, %5
  %25 = load i64, i64* %12, align 8, !dbg !105, !tbaa !86
  %26 = load i64, i64* %13, align 8, !dbg !106, !tbaa !86
  %27 = icmp ult i64 %25, %26, !dbg !107
  br i1 %27, label %28, label %56, !dbg !104

28:                                               ; preds = %24
  %29 = load i64, i64* %12, align 8, !dbg !108, !tbaa !86
  %30 = load i64, i64* %13, align 8, !dbg !109, !tbaa !86
  %31 = add i64 %29, %30, !dbg !110
  %32 = udiv i64 %31, 2, !dbg !111
  store i64 %32, i64* %14, align 8, !dbg !112, !tbaa !86
  %33 = load i8*, i8** %8, align 8, !dbg !113, !tbaa !10
  %34 = load i64, i64* %14, align 8, !dbg !114, !tbaa !86
  %35 = load i64, i64* %10, align 8, !dbg !115, !tbaa !86
  %36 = mul i64 %34, %35, !dbg !116
  %37 = getelementptr inbounds i8, i8* %33, i64 %36, !dbg !117
  store i8* %37, i8** %15, align 8, !dbg !118, !tbaa !10
  %38 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %11, align 8, !dbg !119, !tbaa !10
  %39 = load i8*, i8** %7, align 8, !dbg !120, !tbaa !10
  %40 = load i8*, i8** %15, align 8, !dbg !121, !tbaa !10
  %41 = call i32 %38(i8* %39, i8* %40), !dbg !122
  store i32 %41, i32* %16, align 4, !dbg !123, !tbaa !40
  %42 = load i32, i32* %16, align 4, !dbg !124, !tbaa !40
  %43 = icmp slt i32 %42, 0, !dbg !125
  br i1 %43, label %44, label %46, !dbg !124

44:                                               ; preds = %28
  %45 = load i64, i64* %14, align 8, !dbg !126, !tbaa !86
  store i64 %45, i64* %13, align 8, !dbg !127, !tbaa !86
  br label %55, !dbg !128

46:                                               ; preds = %28
  %47 = load i32, i32* %16, align 4, !dbg !129, !tbaa !40
  %48 = icmp sgt i32 %47, 0, !dbg !130
  br i1 %48, label %49, label %52, !dbg !129

49:                                               ; preds = %46
  %50 = load i64, i64* %14, align 8, !dbg !131, !tbaa !86
  %51 = add i64 %50, 1, !dbg !132
  store i64 %51, i64* %12, align 8, !dbg !133, !tbaa !86
  br label %54, !dbg !134

52:                                               ; preds = %46
  %53 = load i8*, i8** %15, align 8, !dbg !135, !tbaa !10
  store i8* %53, i8** %6, align 8, !dbg !136
  store i32 1, i32* %17, align 4
  br label %57, !dbg !136

54:                                               ; preds = %49
  br label %55

55:                                               ; preds = %54, %44
  br label %24, !dbg !104, !llvm.loop !137

56:                                               ; preds = %24
  store i8* null, i8** %6, align 8, !dbg !139
  store i32 1, i32* %17, align 4
  br label %57, !dbg !139

57:                                               ; preds = %56, %52
  %58 = bitcast i32* %16 to i8*, !dbg !140
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %58) #8, !dbg !140
  %59 = bitcast i8** %15 to i8*, !dbg !140
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %59) #8, !dbg !140
  %60 = bitcast i64* %14 to i8*, !dbg !140
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %60) #8, !dbg !140
  %61 = bitcast i64* %13 to i8*, !dbg !140
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %61) #8, !dbg !140
  %62 = bitcast i64* %12 to i8*, !dbg !140
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %62) #8, !dbg !140
  %63 = load i8*, i8** %6, align 8, !dbg !140
  ret i8* %63, !dbg !140
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally double @atof(i8* nonnull %0) #3 !dbg !141 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = load i8*, i8** %2, align 8, !dbg !143, !tbaa !10
  %4 = call double @strtod(i8* %3, i8** null) #8, !dbg !144
  ret double %4, !dbg !145
}

; Function Attrs: nounwind
declare double @strtod(i8*, i8**) #4

; Function Attrs: nounwind uwtable
define void @task_compute() #7 !dbg !146 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !147, !tbaa !40
  %2 = add nsw i32 %1, 1, !dbg !147
  store i32 %2, i32* @cnt1, align 4, !dbg !147, !tbaa !40
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !148, !tbaa !40
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !149, !tbaa !40
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !150, !tbaa !40
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !151, !tbaa !40
  store i32 0, i32* @test, align 4, !dbg !152, !tbaa !40
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !153, !tbaa !40
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !154, !tbaa !40
  %7 = add nsw i32 %5, %6, !dbg !155
  store i32 %7, i32* @Distribution_idx, align 4, !dbg !156, !tbaa !40
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !157, !tbaa !40
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !158, !tbaa !40
  %10 = add nsw i32 %8, %9, !dbg !159
  store i32 %10, i32* @Distribution_idx_0, align 4, !dbg !160, !tbaa !40
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !161, !tbaa !40
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !162, !tbaa !40
  %13 = add nsw i32 %11, %12, !dbg !163
  store i32 %13, i32* @Distribution_idx_1, align 4, !dbg !164, !tbaa !40
  %14 = load i32, i32* @RT9, align 4, !dbg !165, !tbaa !40
  %15 = load i32, i32* @RT10, align 4, !dbg !166, !tbaa !40
  %16 = add nsw i32 %14, %15, !dbg !167
  store i32 %16, i32* @vkmh, align 4, !dbg !168, !tbaa !40
  %17 = load i32, i32* @test, align 4, !dbg !169, !tbaa !40
  %18 = add nsw i32 %17, 1, !dbg !169
  store i32 %18, i32* @test, align 4, !dbg !169, !tbaa !40
  %19 = load i32, i32* @test, align 4, !dbg !170, !tbaa !40
  %20 = icmp ne i32 %19, 0, !dbg !171
  br i1 %20, label %21, label %22, !dbg !170

21:                                               ; preds = %0
  br label %22, !dbg !172

22:                                               ; preds = %21, %0
  %23 = load i32, i32* @test, align 4, !dbg !173, !tbaa !40
  %24 = icmp ne i32 %23, 1, !dbg !174
  br i1 %24, label %25, label %26, !dbg !173

25:                                               ; preds = %22
  br label %26, !dbg !175

26:                                               ; preds = %25, %22
  %27 = load i32, i32* @vkmh, align 4, !dbg !176, !tbaa !40
  store i32 %27, i32* @RT4_Buffer0, align 4, !dbg !177, !tbaa !40
  %28 = load i32, i32* @Distribution_idx, align 4, !dbg !178, !tbaa !40
  store i32 %28, i32* @RT1_Buffer0, align 4, !dbg !179, !tbaa !40
  %29 = load i32, i32* @Distribution_idx_0, align 4, !dbg !180, !tbaa !40
  store i32 %29, i32* @RT2_Buffer0, align 4, !dbg !181, !tbaa !40
  %30 = load i32, i32* @Distribution_idx_1, align 4, !dbg !182, !tbaa !40
  store i32 %30, i32* @RT3_Buffer0, align 4, !dbg !183, !tbaa !40
  ret void, !dbg !184
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #7 !dbg !185 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = load i32, i32* @cnt2, align 4, !dbg !186, !tbaa !40
  %4 = add nsw i32 %3, 1, !dbg !186
  store i32 %4, i32* @cnt2, align 4, !dbg !186, !tbaa !40
  store i32 0, i32* @test, align 4, !dbg !187, !tbaa !40
  %5 = load i32, i32* @test, align 4, !dbg !188, !tbaa !40
  %6 = icmp ne i32 %5, 0, !dbg !189
  br i1 %6, label %7, label %8, !dbg !188

7:                                                ; preds = %0
  br label %8, !dbg !190

8:                                                ; preds = %7, %0
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !191, !tbaa !40
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !192, !tbaa !40
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !193, !tbaa !40
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !194, !tbaa !40
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !195, !tbaa !40
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !196, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %1) #8, !dbg !197
  %12 = bitcast i32* %2 to i8*, !dbg !198
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #8, !dbg !198
  store i32 100, i32* %2, align 4, !dbg !199, !tbaa !40
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !200, !tbaa !40
  %14 = load i32, i32* %2, align 4, !dbg !201, !tbaa !40
  %15 = icmp sge i32 %13, %14, !dbg !202
  br i1 %15, label %16, label %23, !dbg !200

16:                                               ; preds = %8
  %17 = load i8, i8* %1, align 1, !dbg !203, !tbaa !204, !range !206
  %18 = trunc i8 %17 to i1, !dbg !203
  br i1 %18, label %19, label %20, !dbg !203

19:                                               ; preds = %16
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !207, !tbaa !40
  br label %22, !dbg !208

20:                                               ; preds = %16
  %21 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !209, !tbaa !40
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !210, !tbaa !40
  br label %22

22:                                               ; preds = %20, %19
  br label %25, !dbg !211

23:                                               ; preds = %8
  %24 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !212, !tbaa !40
  store i32 %24, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !213, !tbaa !40
  br label %25

25:                                               ; preds = %23, %22
  %26 = load i32, i32* @RT1_Buffer0, align 4, !dbg !214, !tbaa !40
  store i32 %26, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !215, !tbaa !40
  %27 = bitcast i32* %2 to i8*, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #8, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %1) #8, !dbg !216
  ret void, !dbg !216
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #7 !dbg !217 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = load i32, i32* @cnt3, align 4, !dbg !218, !tbaa !40
  %6 = add nsw i32 %5, 1, !dbg !218
  store i32 %6, i32* @cnt3, align 4, !dbg !218, !tbaa !40
  store i32 0, i32* @test, align 4, !dbg !219, !tbaa !40
  %7 = load i32, i32* @test, align 4, !dbg !220, !tbaa !40
  %8 = icmp ne i32 %7, 0, !dbg !221
  br i1 %8, label %9, label %10, !dbg !220

9:                                                ; preds = %0
  br label %10, !dbg !222

10:                                               ; preds = %9, %0
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !223, !tbaa !40
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !224, !tbaa !40
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !225, !tbaa !40
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !226, !tbaa !40
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !227, !tbaa !40
  store i32 %13, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !228, !tbaa !40
  %14 = bitcast i32* %1 to i8*, !dbg !229
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #8, !dbg !229
  store i32 10, i32* %1, align 4, !dbg !230, !tbaa !40
  %15 = load i32, i32* @RT_Buffer0, align 4, !dbg !231, !tbaa !40
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !232, !tbaa !40
  %16 = load i32, i32* @RT4_Buffer0, align 4, !dbg !233, !tbaa !40
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !234, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %2) #8, !dbg !235
  %17 = bitcast i32* %3 to i8*, !dbg !236
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #8, !dbg !236
  store i32 100, i32* %3, align 4, !dbg !237, !tbaa !40
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !238, !tbaa !40
  %19 = load i32, i32* %3, align 4, !dbg !239, !tbaa !40
  %20 = icmp sge i32 %18, %19, !dbg !240
  br i1 %20, label %21, label %28, !dbg !238

21:                                               ; preds = %10
  %22 = load i8, i8* %2, align 1, !dbg !241, !tbaa !204, !range !206
  %23 = trunc i8 %22 to i1, !dbg !241
  br i1 %23, label %24, label %25, !dbg !241

24:                                               ; preds = %21
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !242, !tbaa !40
  br label %27, !dbg !243

25:                                               ; preds = %21
  %26 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !244, !tbaa !40
  store i32 %26, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !245, !tbaa !40
  br label %27

27:                                               ; preds = %25, %24
  br label %30, !dbg !246

28:                                               ; preds = %10
  %29 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !247, !tbaa !40
  store i32 %29, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !248, !tbaa !40
  br label %30

30:                                               ; preds = %28, %27
  %31 = bitcast i32* %4 to i8*, !dbg !249
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %31) #8, !dbg !249
  store i32 50, i32* %4, align 4, !dbg !250, !tbaa !40
  %32 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !251, !tbaa !40
  %33 = load i32, i32* %4, align 4, !dbg !252, !tbaa !40
  %34 = add nsw i32 %32, %33, !dbg !253
  store i32 %34, i32* @RT14, align 4, !dbg !254, !tbaa !40
  %35 = load i32, i32* %1, align 4, !dbg !255, !tbaa !40
  store i32 %35, i32* @RT12, align 4, !dbg !256, !tbaa !40
  %36 = bitcast i32* %4 to i8*, !dbg !257
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #8, !dbg !257
  %37 = bitcast i32* %3 to i8*, !dbg !257
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #8, !dbg !257
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %2) #8, !dbg !257
  %38 = bitcast i32* %1 to i8*, !dbg !257
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #8, !dbg !257
  ret void, !dbg !257
}

; Function Attrs: nounwind uwtable
define void @task_isr_3() #7 !dbg !258 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = load i32, i32* @cnt4, align 4, !dbg !259, !tbaa !40
  %5 = add nsw i32 %4, 1, !dbg !259
  store i32 %5, i32* @cnt4, align 4, !dbg !259, !tbaa !40
  store i32 0, i32* @test, align 4, !dbg !260, !tbaa !40
  %6 = load i32, i32* @test, align 4, !dbg !261, !tbaa !40
  %7 = icmp ne i32 %6, 0, !dbg !262
  br i1 %7, label %8, label %9, !dbg !261

8:                                                ; preds = %0
  br label %9, !dbg !263

9:                                                ; preds = %8, %0
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !264, !tbaa !40
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !265, !tbaa !40
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !266, !tbaa !40
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !267, !tbaa !40
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !268, !tbaa !40
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !269, !tbaa !40
  %13 = bitcast i32* %1 to i8*, !dbg !270
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #8, !dbg !270
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %2) #8, !dbg !271
  %14 = bitcast i32* %3 to i8*, !dbg !272
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #8, !dbg !272
  store i32 100, i32* %3, align 4, !dbg !273, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !274, !tbaa !40
  %16 = load i32, i32* %3, align 4, !dbg !275, !tbaa !40
  %17 = icmp sge i32 %15, %16, !dbg !276
  br i1 %17, label %18, label %25, !dbg !274

18:                                               ; preds = %9
  %19 = load i8, i8* %2, align 1, !dbg !277, !tbaa !204, !range !206
  %20 = trunc i8 %19 to i1, !dbg !277
  br i1 %20, label %21, label %22, !dbg !277

21:                                               ; preds = %18
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !278, !tbaa !40
  br label %24, !dbg !279

22:                                               ; preds = %18
  %23 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !280, !tbaa !40
  store i32 %23, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !281, !tbaa !40
  br label %24

24:                                               ; preds = %22, %21
  br label %27, !dbg !282

25:                                               ; preds = %9
  %26 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !283, !tbaa !40
  store i32 %26, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !284, !tbaa !40
  br label %27

27:                                               ; preds = %25, %24
  %28 = load i32, i32* @RT3_Buffer0, align 4, !dbg !285, !tbaa !40
  store i32 %28, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !286, !tbaa !40
  %29 = load i32, i32* %1, align 4, !dbg !287, !tbaa !40
  store i32 %29, i32* @RT11, align 4, !dbg !288, !tbaa !40
  %30 = bitcast i32* %3 to i8*, !dbg !289
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #8, !dbg !289
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %2) #8, !dbg !289
  %31 = bitcast i32* %1 to i8*, !dbg !289
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #8, !dbg !289
  ret void, !dbg !289
}

; Function Attrs: nounwind uwtable
define i8* @task_RL_Wheel(i8* %0) #7 !dbg !290 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8* %0, i8** %3, align 8, !tbaa !10
  %13 = load i32, i32* @test, align 4, !dbg !291, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !291
  store i32 %14, i32* @test, align 4, !dbg !291, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !292, !tbaa !40
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !293, !tbaa !40
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !294, !tbaa !40
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !295, !tbaa !40
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !296, !tbaa !40
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !297, !tbaa !40
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !298, !tbaa !40
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !299, !tbaa !40
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !300, !tbaa !40
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !301, !tbaa !40
  %20 = bitcast i32* %4 to i8*, !dbg !302
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #8, !dbg !302
  %21 = load i32, i32* @RT_Buffer0, align 4, !dbg !303, !tbaa !40
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !304, !tbaa !40
  %22 = load i32, i32* @RT4_Buffer0, align 4, !dbg !305, !tbaa !40
  store i32 %22, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !306, !tbaa !40
  store i32 10, i32* %4, align 4, !dbg !307, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #8, !dbg !308
  %23 = bitcast i32* %6 to i8*, !dbg !309
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #8, !dbg !309
  %24 = bitcast i32* %7 to i8*, !dbg !310
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #8, !dbg !310
  %25 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !311, !tbaa !40
  %26 = add nsw i32 10, %25, !dbg !312
  store i32 %26, i32* %6, align 4, !dbg !313, !tbaa !40
  %27 = load i32, i32* %6, align 4, !dbg !314, !tbaa !40
  %28 = add nsw i32 %27, 10, !dbg !315
  store i32 %28, i32* %7, align 4, !dbg !316, !tbaa !40
  %29 = load i32, i32* %7, align 4, !dbg !317, !tbaa !40
  %30 = load i32, i32* %4, align 4, !dbg !318, !tbaa !40
  %31 = add nsw i32 %29, %30, !dbg !319
  store i32 %31, i32* %7, align 4, !dbg !320, !tbaa !40
  %32 = bitcast i32* %8 to i8*, !dbg !321
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %32) #8, !dbg !321
  store i32 100, i32* %8, align 4, !dbg !322, !tbaa !40
  %33 = load i32, i32* %7, align 4, !dbg !323, !tbaa !40
  %34 = load i32, i32* %8, align 4, !dbg !324, !tbaa !40
  %35 = icmp sge i32 %33, %34, !dbg !325
  br i1 %35, label %36, label %37, !dbg !323

36:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !326, !tbaa !40
  br label %45, !dbg !327

37:                                               ; preds = %1
  %38 = bitcast i32* %9 to i8*, !dbg !328
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %38) #8, !dbg !328
  store i32 5, i32* %9, align 4, !dbg !329, !tbaa !40
  %39 = load i32, i32* %7, align 4, !dbg !330, !tbaa !40
  %40 = load i32, i32* %9, align 4, !dbg !331, !tbaa !40
  %41 = icmp sle i32 %39, %40, !dbg !332
  br i1 %41, label %42, label %43, !dbg !330

42:                                               ; preds = %37
  store i32 5, i32* %7, align 4, !dbg !333, !tbaa !40
  br label %43, !dbg !334

43:                                               ; preds = %42, %37
  %44 = bitcast i32* %9 to i8*, !dbg !335
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #8, !dbg !335
  br label %45

45:                                               ; preds = %43, %36
  %46 = bitcast i32* %10 to i8*, !dbg !336
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %46) #8, !dbg !336
  store i32 10, i32* %10, align 4, !dbg !337, !tbaa !40
  %47 = bitcast i32* %11 to i8*, !dbg !338
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %47) #8, !dbg !338
  %48 = load i32, i32* %6, align 4, !dbg !339, !tbaa !40
  %49 = add nsw i32 10, %48, !dbg !340
  store i32 %49, i32* %11, align 4, !dbg !341, !tbaa !40
  %50 = load i32, i32* %10, align 4, !dbg !342, !tbaa !40
  %51 = load i32, i32* %11, align 4, !dbg !343, !tbaa !40
  %52 = icmp sgt i32 %50, %51, !dbg !344
  br i1 %52, label %53, label %54, !dbg !342

53:                                               ; preds = %45
  store i8 1, i8* %5, align 1, !dbg !345, !tbaa !204
  br label %55, !dbg !346

54:                                               ; preds = %45
  store i8 0, i8* %5, align 1, !dbg !347, !tbaa !204
  br label %55

55:                                               ; preds = %54, %53
  %56 = bitcast i32* %12 to i8*, !dbg !348
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %56) #8, !dbg !348
  store i32 100, i32* %12, align 4, !dbg !349, !tbaa !40
  %57 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !350, !tbaa !40
  %58 = load i32, i32* %12, align 4, !dbg !351, !tbaa !40
  %59 = icmp sge i32 %57, %58, !dbg !352
  br i1 %59, label %60, label %67, !dbg !350

60:                                               ; preds = %55
  %61 = load i8, i8* %5, align 1, !dbg !353, !tbaa !204, !range !206
  %62 = trunc i8 %61 to i1, !dbg !353
  br i1 %62, label %63, label %64, !dbg !353

63:                                               ; preds = %60
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !354, !tbaa !40
  br label %66, !dbg !355

64:                                               ; preds = %60
  %65 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !356, !tbaa !40
  store i32 %65, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !357, !tbaa !40
  br label %66

66:                                               ; preds = %64, %63
  br label %69, !dbg !358

67:                                               ; preds = %55
  %68 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !359, !tbaa !40
  store i32 %68, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !360, !tbaa !40
  br label %69

69:                                               ; preds = %67, %66
  %70 = load i32, i32* @RT2_Buffer0, align 4, !dbg !361, !tbaa !40
  store i32 %70, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !362, !tbaa !40
  %71 = load i32, i32* %4, align 4, !dbg !363, !tbaa !40
  store i32 %71, i32* @RT10, align 4, !dbg !364, !tbaa !40
  %72 = bitcast i32* %12 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #8, !dbg !365
  %73 = bitcast i32* %11 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #8, !dbg !365
  %74 = bitcast i32* %10 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #8, !dbg !365
  %75 = bitcast i32* %8 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #8, !dbg !365
  %76 = bitcast i32* %7 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #8, !dbg !365
  %77 = bitcast i32* %6 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #8, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #8, !dbg !365
  %78 = bitcast i32* %4 to i8*, !dbg !365
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %78) #8, !dbg !365
  %79 = load i8*, i8** %2, align 8, !dbg !365
  ret i8* %79, !dbg !365
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_006_001_main() #7 !dbg !366 {
  store i32 0, i32* @test, align 4, !dbg !367, !tbaa !40
  call void @task_compute(), !dbg !368
  ret i32 0, !dbg !369
}

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone willreturn }
attributes #3 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }

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
!7 = distinct !DISubprogram(name: "vprintf", scope: !8, file: !8, line: 36, type: !9, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 38, column: 20, scope: !7)
!15 = !DILocation(line: 38, column: 28, scope: !7)
!16 = !DILocation(line: 38, column: 35, scope: !7)
!17 = !DILocation(line: 38, column: 10, scope: !7)
!18 = !DILocation(line: 38, column: 3, scope: !7)
!19 = distinct !DISubprogram(name: "getchar", scope: !8, file: !8, line: 44, type: !9, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!20 = !DILocation(line: 46, column: 20, scope: !19)
!21 = !DILocation(line: 46, column: 10, scope: !19)
!22 = !DILocation(line: 46, column: 3, scope: !19)
!23 = distinct !DISubprogram(name: "fgetc_unlocked", scope: !8, file: !8, line: 53, type: !9, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 55, column: 10, scope: !23)
!25 = !{!26, !11, i64 8}
!26 = !{!"_IO_FILE", !27, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !11, i64 72, !11, i64 80, !11, i64 88, !11, i64 96, !11, i64 104, !27, i64 112, !27, i64 116, !28, i64 120, !29, i64 128, !12, i64 130, !12, i64 131, !11, i64 136, !28, i64 144, !11, i64 152, !11, i64 160, !11, i64 168, !11, i64 176, !28, i64 184, !27, i64 192, !12, i64 196}
!27 = !{!"int", !12, i64 0}
!28 = !{!"long", !12, i64 0}
!29 = !{!"short", !12, i64 0}
!30 = !{!26, !11, i64 16}
!31 = !{!12, !12, i64 0}
!32 = !DILocation(line: 55, column: 3, scope: !23)
!33 = distinct !DISubprogram(name: "getc_unlocked", scope: !8, file: !8, line: 63, type: !9, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 65, column: 10, scope: !33)
!35 = !DILocation(line: 65, column: 3, scope: !33)
!36 = distinct !DISubprogram(name: "getchar_unlocked", scope: !8, file: !8, line: 70, type: !9, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 72, column: 10, scope: !36)
!38 = !DILocation(line: 72, column: 3, scope: !36)
!39 = distinct !DISubprogram(name: "putchar", scope: !8, file: !8, line: 79, type: !9, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = !{!27, !27, i64 0}
!41 = !DILocation(line: 81, column: 20, scope: !39)
!42 = !DILocation(line: 81, column: 25, scope: !39)
!43 = !DILocation(line: 81, column: 10, scope: !39)
!44 = !DILocation(line: 81, column: 3, scope: !39)
!45 = distinct !DISubprogram(name: "fputc_unlocked", scope: !8, file: !8, line: 88, type: !9, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 90, column: 10, scope: !45)
!47 = !{!26, !11, i64 40}
!48 = !{!26, !11, i64 48}
!49 = !DILocation(line: 90, column: 3, scope: !45)
!50 = distinct !DISubprogram(name: "putc_unlocked", scope: !8, file: !8, line: 98, type: !9, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 100, column: 10, scope: !50)
!52 = !DILocation(line: 100, column: 3, scope: !50)
!53 = distinct !DISubprogram(name: "putchar_unlocked", scope: !8, file: !8, line: 105, type: !9, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 107, column: 10, scope: !53)
!55 = !DILocation(line: 107, column: 3, scope: !53)
!56 = distinct !DISubprogram(name: "feof_unlocked", scope: !8, file: !8, line: 125, type: !9, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 127, column: 10, scope: !56)
!58 = !{!26, !27, i64 0}
!59 = !DILocation(line: 127, column: 3, scope: !56)
!60 = distinct !DISubprogram(name: "ferror_unlocked", scope: !8, file: !8, line: 132, type: !9, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 134, column: 10, scope: !60)
!62 = !DILocation(line: 134, column: 3, scope: !60)
!63 = distinct !DISubprogram(name: "atoi", scope: !64, file: !64, line: 361, type: !9, scopeLine: 362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!64 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!65 = !DILocation(line: 363, column: 24, scope: !63)
!66 = !DILocation(line: 363, column: 16, scope: !63)
!67 = !DILocation(line: 363, column: 10, scope: !63)
!68 = !DILocation(line: 363, column: 3, scope: !63)
!69 = distinct !DISubprogram(name: "atol", scope: !64, file: !64, line: 366, type: !9, scopeLine: 367, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 368, column: 18, scope: !69)
!71 = !DILocation(line: 368, column: 10, scope: !69)
!72 = !DILocation(line: 368, column: 3, scope: !69)
!73 = distinct !DISubprogram(name: "atoll", scope: !64, file: !64, line: 373, type: !9, scopeLine: 374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 375, column: 19, scope: !73)
!75 = !DILocation(line: 375, column: 10, scope: !73)
!76 = !DILocation(line: 375, column: 3, scope: !73)
!77 = distinct !DISubprogram(name: "__uint16_identity", scope: !78, file: !78, line: 33, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!78 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!79 = !{!29, !29, i64 0}
!80 = !DILocation(line: 35, column: 10, scope: !77)
!81 = !DILocation(line: 35, column: 3, scope: !77)
!82 = distinct !DISubprogram(name: "__uint32_identity", scope: !78, file: !78, line: 39, type: !9, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 41, column: 10, scope: !82)
!84 = !DILocation(line: 41, column: 3, scope: !82)
!85 = distinct !DISubprogram(name: "__uint64_identity", scope: !78, file: !78, line: 45, type: !9, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!86 = !{!28, !28, i64 0}
!87 = !DILocation(line: 47, column: 10, scope: !85)
!88 = !DILocation(line: 47, column: 3, scope: !85)
!89 = distinct !DISubprogram(name: "gnu_dev_major", scope: !90, file: !90, line: 79, type: !9, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/sysmacros.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!91 = !DILocation(line: 79, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "gnu_dev_minor", scope: !90, file: !90, line: 80, type: !9, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 80, column: 1, scope: !92)
!94 = distinct !DISubprogram(name: "gnu_dev_makedev", scope: !90, file: !90, line: 81, type: !9, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 81, column: 1, scope: !94)
!96 = distinct !DISubprogram(name: "bsearch", scope: !97, file: !97, line: 20, type: !9, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!98 = !DILocation(line: 23, column: 3, scope: !96)
!99 = !DILocation(line: 24, column: 3, scope: !96)
!100 = !DILocation(line: 25, column: 3, scope: !96)
!101 = !DILocation(line: 27, column: 7, scope: !96)
!102 = !DILocation(line: 28, column: 9, scope: !96)
!103 = !DILocation(line: 28, column: 7, scope: !96)
!104 = !DILocation(line: 29, column: 3, scope: !96)
!105 = !DILocation(line: 29, column: 10, scope: !96)
!106 = !DILocation(line: 29, column: 16, scope: !96)
!107 = !DILocation(line: 29, column: 14, scope: !96)
!108 = !DILocation(line: 31, column: 16, scope: !96)
!109 = !DILocation(line: 31, column: 22, scope: !96)
!110 = !DILocation(line: 31, column: 20, scope: !96)
!111 = !DILocation(line: 31, column: 27, scope: !96)
!112 = !DILocation(line: 31, column: 13, scope: !96)
!113 = !DILocation(line: 32, column: 39, scope: !96)
!114 = !DILocation(line: 32, column: 50, scope: !96)
!115 = !DILocation(line: 32, column: 58, scope: !96)
!116 = !DILocation(line: 32, column: 56, scope: !96)
!117 = !DILocation(line: 32, column: 47, scope: !96)
!118 = !DILocation(line: 32, column: 11, scope: !96)
!119 = !DILocation(line: 33, column: 24, scope: !96)
!120 = !DILocation(line: 33, column: 35, scope: !96)
!121 = !DILocation(line: 33, column: 42, scope: !96)
!122 = !DILocation(line: 33, column: 22, scope: !96)
!123 = !DILocation(line: 33, column: 20, scope: !96)
!124 = !DILocation(line: 34, column: 11, scope: !96)
!125 = !DILocation(line: 34, column: 24, scope: !96)
!126 = !DILocation(line: 35, column: 8, scope: !96)
!127 = !DILocation(line: 35, column: 6, scope: !96)
!128 = !DILocation(line: 35, column: 2, scope: !96)
!129 = !DILocation(line: 36, column: 16, scope: !96)
!130 = !DILocation(line: 36, column: 29, scope: !96)
!131 = !DILocation(line: 37, column: 8, scope: !96)
!132 = !DILocation(line: 37, column: 14, scope: !96)
!133 = !DILocation(line: 37, column: 6, scope: !96)
!134 = !DILocation(line: 37, column: 2, scope: !96)
!135 = !DILocation(line: 39, column: 18, scope: !96)
!136 = !DILocation(line: 39, column: 2, scope: !96)
!137 = distinct !{!137, !104, !138}
!138 = !DILocation(line: 40, column: 5, scope: !96)
!139 = !DILocation(line: 42, column: 3, scope: !96)
!140 = !DILocation(line: 43, column: 1, scope: !96)
!141 = distinct !DISubprogram(name: "atof", scope: !142, file: !142, line: 25, type: !9, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!142 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
!143 = !DILocation(line: 27, column: 18, scope: !141)
!144 = !DILocation(line: 27, column: 10, scope: !141)
!145 = !DILocation(line: 27, column: 3, scope: !141)
!146 = distinct !DISubprogram(name: "task_compute", scope: !1, file: !1, line: 226, type: !9, scopeLine: 226, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!147 = !DILocation(line: 231, column: 14, scope: !146)
!148 = !DILocation(line: 235, column: 41, scope: !146)
!149 = !DILocation(line: 235, column: 39, scope: !146)
!150 = !DILocation(line: 238, column: 40, scope: !146)
!151 = !DILocation(line: 238, column: 38, scope: !146)
!152 = !DILocation(line: 250, column: 10, scope: !146)
!153 = !DILocation(line: 258, column: 24, scope: !146)
!154 = !DILocation(line: 259, column: 9, scope: !146)
!155 = !DILocation(line: 258, column: 66, scope: !146)
!156 = !DILocation(line: 258, column: 22, scope: !146)
!157 = !DILocation(line: 260, column: 26, scope: !146)
!158 = !DILocation(line: 261, column: 9, scope: !146)
!159 = !DILocation(line: 260, column: 68, scope: !146)
!160 = !DILocation(line: 260, column: 24, scope: !146)
!161 = !DILocation(line: 262, column: 26, scope: !146)
!162 = !DILocation(line: 263, column: 9, scope: !146)
!163 = !DILocation(line: 262, column: 68, scope: !146)
!164 = !DILocation(line: 262, column: 24, scope: !146)
!165 = !DILocation(line: 277, column: 12, scope: !146)
!166 = !DILocation(line: 277, column: 16, scope: !146)
!167 = !DILocation(line: 277, column: 15, scope: !146)
!168 = !DILocation(line: 277, column: 10, scope: !146)
!169 = !DILocation(line: 285, column: 9, scope: !146)
!170 = !DILocation(line: 288, column: 9, scope: !146)
!171 = !DILocation(line: 288, column: 14, scope: !146)
!172 = !DILocation(line: 290, column: 5, scope: !146)
!173 = !DILocation(line: 293, column: 9, scope: !146)
!174 = !DILocation(line: 293, column: 14, scope: !146)
!175 = !DILocation(line: 295, column: 5, scope: !146)
!176 = !DILocation(line: 311, column: 19, scope: !146)
!177 = !DILocation(line: 311, column: 17, scope: !146)
!178 = !DILocation(line: 314, column: 19, scope: !146)
!179 = !DILocation(line: 314, column: 17, scope: !146)
!180 = !DILocation(line: 317, column: 19, scope: !146)
!181 = !DILocation(line: 317, column: 17, scope: !146)
!182 = !DILocation(line: 320, column: 19, scope: !146)
!183 = !DILocation(line: 320, column: 17, scope: !146)
!184 = !DILocation(line: 323, column: 1, scope: !146)
!185 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 325, type: !9, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!186 = !DILocation(line: 330, column: 14, scope: !185)
!187 = !DILocation(line: 331, column: 10, scope: !185)
!188 = !DILocation(line: 334, column: 9, scope: !185)
!189 = !DILocation(line: 334, column: 14, scope: !185)
!190 = !DILocation(line: 336, column: 5, scope: !185)
!191 = !DILocation(line: 339, column: 41, scope: !185)
!192 = !DILocation(line: 339, column: 39, scope: !185)
!193 = !DILocation(line: 341, column: 40, scope: !185)
!194 = !DILocation(line: 341, column: 38, scope: !185)
!195 = !DILocation(line: 343, column: 40, scope: !185)
!196 = !DILocation(line: 343, column: 38, scope: !185)
!197 = !DILocation(line: 361, column: 5, scope: !185)
!198 = !DILocation(line: 396, column: 5, scope: !185)
!199 = !DILocation(line: 396, column: 9, scope: !185)
!200 = !DILocation(line: 397, column: 9, scope: !185)
!201 = !DILocation(line: 397, column: 45, scope: !185)
!202 = !DILocation(line: 397, column: 42, scope: !185)
!203 = !DILocation(line: 403, column: 13, scope: !185)
!204 = !{!205, !205, i64 0}
!205 = !{!"_Bool", !12, i64 0}
!206 = !{i8 0, i8 2}
!207 = !DILocation(line: 404, column: 71, scope: !185)
!208 = !DILocation(line: 405, column: 9, scope: !185)
!209 = !DILocation(line: 406, column: 73, scope: !185)
!210 = !DILocation(line: 406, column: 71, scope: !185)
!211 = !DILocation(line: 409, column: 5, scope: !185)
!212 = !DILocation(line: 412, column: 69, scope: !185)
!213 = !DILocation(line: 412, column: 67, scope: !185)
!214 = !DILocation(line: 421, column: 40, scope: !185)
!215 = !DILocation(line: 421, column: 38, scope: !185)
!216 = !DILocation(line: 430, column: 1, scope: !185)
!217 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 432, type: !9, scopeLine: 432, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!218 = !DILocation(line: 438, column: 13, scope: !217)
!219 = !DILocation(line: 439, column: 10, scope: !217)
!220 = !DILocation(line: 442, column: 9, scope: !217)
!221 = !DILocation(line: 442, column: 14, scope: !217)
!222 = !DILocation(line: 444, column: 5, scope: !217)
!223 = !DILocation(line: 448, column: 41, scope: !217)
!224 = !DILocation(line: 448, column: 39, scope: !217)
!225 = !DILocation(line: 450, column: 40, scope: !217)
!226 = !DILocation(line: 450, column: 38, scope: !217)
!227 = !DILocation(line: 452, column: 40, scope: !217)
!228 = !DILocation(line: 452, column: 38, scope: !217)
!229 = !DILocation(line: 457, column: 5, scope: !217)
!230 = !DILocation(line: 462, column: 17, scope: !217)
!231 = !DILocation(line: 464, column: 45, scope: !217)
!232 = !DILocation(line: 464, column: 43, scope: !217)
!233 = !DILocation(line: 466, column: 40, scope: !217)
!234 = !DILocation(line: 466, column: 38, scope: !217)
!235 = !DILocation(line: 477, column: 5, scope: !217)
!236 = !DILocation(line: 517, column: 5, scope: !217)
!237 = !DILocation(line: 517, column: 9, scope: !217)
!238 = !DILocation(line: 518, column: 9, scope: !217)
!239 = !DILocation(line: 518, column: 45, scope: !217)
!240 = !DILocation(line: 518, column: 42, scope: !217)
!241 = !DILocation(line: 523, column: 13, scope: !217)
!242 = !DILocation(line: 524, column: 71, scope: !217)
!243 = !DILocation(line: 525, column: 9, scope: !217)
!244 = !DILocation(line: 526, column: 73, scope: !217)
!245 = !DILocation(line: 526, column: 71, scope: !217)
!246 = !DILocation(line: 529, column: 5, scope: !217)
!247 = !DILocation(line: 532, column: 69, scope: !217)
!248 = !DILocation(line: 532, column: 67, scope: !217)
!249 = !DILocation(line: 552, column: 5, scope: !217)
!250 = !DILocation(line: 554, column: 13, scope: !217)
!251 = !DILocation(line: 565, column: 12, scope: !217)
!252 = !DILocation(line: 565, column: 48, scope: !217)
!253 = !DILocation(line: 565, column: 46, scope: !217)
!254 = !DILocation(line: 565, column: 10, scope: !217)
!255 = !DILocation(line: 567, column: 12, scope: !217)
!256 = !DILocation(line: 567, column: 10, scope: !217)
!257 = !DILocation(line: 569, column: 1, scope: !217)
!258 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 571, type: !9, scopeLine: 572, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!259 = !DILocation(line: 574, column: 13, scope: !258)
!260 = !DILocation(line: 575, column: 10, scope: !258)
!261 = !DILocation(line: 578, column: 9, scope: !258)
!262 = !DILocation(line: 578, column: 14, scope: !258)
!263 = !DILocation(line: 580, column: 5, scope: !258)
!264 = !DILocation(line: 584, column: 41, scope: !258)
!265 = !DILocation(line: 584, column: 39, scope: !258)
!266 = !DILocation(line: 586, column: 40, scope: !258)
!267 = !DILocation(line: 586, column: 38, scope: !258)
!268 = !DILocation(line: 588, column: 40, scope: !258)
!269 = !DILocation(line: 588, column: 38, scope: !258)
!270 = !DILocation(line: 596, column: 5, scope: !258)
!271 = !DILocation(line: 614, column: 5, scope: !258)
!272 = !DILocation(line: 652, column: 5, scope: !258)
!273 = !DILocation(line: 652, column: 9, scope: !258)
!274 = !DILocation(line: 653, column: 9, scope: !258)
!275 = !DILocation(line: 653, column: 45, scope: !258)
!276 = !DILocation(line: 653, column: 42, scope: !258)
!277 = !DILocation(line: 658, column: 13, scope: !258)
!278 = !DILocation(line: 659, column: 71, scope: !258)
!279 = !DILocation(line: 660, column: 9, scope: !258)
!280 = !DILocation(line: 661, column: 73, scope: !258)
!281 = !DILocation(line: 661, column: 71, scope: !258)
!282 = !DILocation(line: 664, column: 5, scope: !258)
!283 = !DILocation(line: 667, column: 69, scope: !258)
!284 = !DILocation(line: 667, column: 67, scope: !258)
!285 = !DILocation(line: 677, column: 40, scope: !258)
!286 = !DILocation(line: 677, column: 38, scope: !258)
!287 = !DILocation(line: 680, column: 12, scope: !258)
!288 = !DILocation(line: 680, column: 10, scope: !258)
!289 = !DILocation(line: 682, column: 1, scope: !258)
!290 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !1, file: !1, line: 684, type: !9, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!291 = !DILocation(line: 686, column: 10, scope: !290)
!292 = !DILocation(line: 690, column: 41, scope: !290)
!293 = !DILocation(line: 690, column: 39, scope: !290)
!294 = !DILocation(line: 692, column: 40, scope: !290)
!295 = !DILocation(line: 692, column: 38, scope: !290)
!296 = !DILocation(line: 694, column: 40, scope: !290)
!297 = !DILocation(line: 694, column: 38, scope: !290)
!298 = !DILocation(line: 696, column: 40, scope: !290)
!299 = !DILocation(line: 696, column: 38, scope: !290)
!300 = !DILocation(line: 698, column: 40, scope: !290)
!301 = !DILocation(line: 698, column: 38, scope: !290)
!302 = !DILocation(line: 702, column: 5, scope: !290)
!303 = !DILocation(line: 704, column: 41, scope: !290)
!304 = !DILocation(line: 704, column: 39, scope: !290)
!305 = !DILocation(line: 706, column: 40, scope: !290)
!306 = !DILocation(line: 706, column: 38, scope: !290)
!307 = !DILocation(line: 708, column: 15, scope: !290)
!308 = !DILocation(line: 710, column: 5, scope: !290)
!309 = !DILocation(line: 711, column: 5, scope: !290)
!310 = !DILocation(line: 712, column: 5, scope: !290)
!311 = !DILocation(line: 713, column: 62, scope: !290)
!312 = !DILocation(line: 713, column: 60, scope: !290)
!313 = !DILocation(line: 713, column: 13, scope: !290)
!314 = !DILocation(line: 715, column: 9, scope: !290)
!315 = !DILocation(line: 715, column: 17, scope: !290)
!316 = !DILocation(line: 715, column: 7, scope: !290)
!317 = !DILocation(line: 716, column: 9, scope: !290)
!318 = !DILocation(line: 716, column: 13, scope: !290)
!319 = !DILocation(line: 716, column: 11, scope: !290)
!320 = !DILocation(line: 716, column: 7, scope: !290)
!321 = !DILocation(line: 718, column: 5, scope: !290)
!322 = !DILocation(line: 718, column: 9, scope: !290)
!323 = !DILocation(line: 720, column: 9, scope: !290)
!324 = !DILocation(line: 720, column: 14, scope: !290)
!325 = !DILocation(line: 720, column: 11, scope: !290)
!326 = !DILocation(line: 721, column: 11, scope: !290)
!327 = !DILocation(line: 722, column: 5, scope: !290)
!328 = !DILocation(line: 723, column: 9, scope: !290)
!329 = !DILocation(line: 723, column: 13, scope: !290)
!330 = !DILocation(line: 724, column: 13, scope: !290)
!331 = !DILocation(line: 724, column: 18, scope: !290)
!332 = !DILocation(line: 724, column: 15, scope: !290)
!333 = !DILocation(line: 725, column: 15, scope: !290)
!334 = !DILocation(line: 726, column: 9, scope: !290)
!335 = !DILocation(line: 727, column: 5, scope: !290)
!336 = !DILocation(line: 736, column: 5, scope: !290)
!337 = !DILocation(line: 736, column: 9, scope: !290)
!338 = !DILocation(line: 737, column: 5, scope: !290)
!339 = !DILocation(line: 737, column: 80, scope: !290)
!340 = !DILocation(line: 737, column: 78, scope: !290)
!341 = !DILocation(line: 737, column: 9, scope: !290)
!342 = !DILocation(line: 738, column: 9, scope: !290)
!343 = !DILocation(line: 738, column: 16, scope: !290)
!344 = !DILocation(line: 738, column: 14, scope: !290)
!345 = !DILocation(line: 739, column: 32, scope: !290)
!346 = !DILocation(line: 740, column: 5, scope: !290)
!347 = !DILocation(line: 741, column: 32, scope: !290)
!348 = !DILocation(line: 746, column: 5, scope: !290)
!349 = !DILocation(line: 746, column: 9, scope: !290)
!350 = !DILocation(line: 747, column: 9, scope: !290)
!351 = !DILocation(line: 747, column: 45, scope: !290)
!352 = !DILocation(line: 747, column: 42, scope: !290)
!353 = !DILocation(line: 752, column: 13, scope: !290)
!354 = !DILocation(line: 753, column: 71, scope: !290)
!355 = !DILocation(line: 754, column: 9, scope: !290)
!356 = !DILocation(line: 755, column: 73, scope: !290)
!357 = !DILocation(line: 755, column: 71, scope: !290)
!358 = !DILocation(line: 759, column: 5, scope: !290)
!359 = !DILocation(line: 762, column: 69, scope: !290)
!360 = !DILocation(line: 762, column: 67, scope: !290)
!361 = !DILocation(line: 773, column: 40, scope: !290)
!362 = !DILocation(line: 773, column: 38, scope: !290)
!363 = !DILocation(line: 776, column: 12, scope: !290)
!364 = !DILocation(line: 776, column: 10, scope: !290)
!365 = !DILocation(line: 777, column: 1, scope: !290)
!366 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !1, file: !1, line: 785, type: !9, scopeLine: 786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!367 = !DILocation(line: 789, column: 10, scope: !366)
!368 = !DILocation(line: 792, column: 5, scope: !366)
!369 = !DILocation(line: 801, column: 5, scope: !366)
