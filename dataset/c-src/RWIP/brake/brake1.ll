; ModuleID = 'brake1.bc'
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
define void @task_isr_1() #7 !dbg !146 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !147, !tbaa !40
  %2 = add nsw i32 %1, 1, !dbg !147
  store i32 %2, i32* @cnt1, align 4, !dbg !147, !tbaa !40
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !148, !tbaa !40
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !149, !tbaa !40
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !150, !tbaa !40
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !151, !tbaa !40
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !152, !tbaa !40
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !153, !tbaa !40
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !154, !tbaa !40
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !155, !tbaa !40
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !156, !tbaa !40
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !157, !tbaa !40
  store i32 0, i32* @test, align 4, !dbg !158, !tbaa !40
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !159, !tbaa !40
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !160, !tbaa !40
  %10 = add nsw i32 %8, %9, !dbg !161
  store i32 %10, i32* @Distribution_idx, align 4, !dbg !162, !tbaa !40
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !163, !tbaa !40
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !164, !tbaa !40
  %13 = add nsw i32 %11, %12, !dbg !165
  store i32 %13, i32* @Distribution_idx_0, align 4, !dbg !166, !tbaa !40
  %14 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !167, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !168, !tbaa !40
  %16 = add nsw i32 %14, %15, !dbg !169
  store i32 %16, i32* @Distribution_idx_1, align 4, !dbg !170, !tbaa !40
  %17 = load i32, i32* @RT9, align 4, !dbg !171, !tbaa !40
  %18 = load i32, i32* @RT10, align 4, !dbg !172, !tbaa !40
  %19 = add nsw i32 %17, %18, !dbg !173
  store i32 %19, i32* @vkmh, align 4, !dbg !174, !tbaa !40
  %20 = load i32, i32* @vkmh, align 4, !dbg !175, !tbaa !40
  %21 = load i32, i32* @RT11, align 4, !dbg !176, !tbaa !40
  %22 = add nsw i32 %20, %21, !dbg !177
  store i32 %22, i32* @vkmh, align 4, !dbg !178, !tbaa !40
  %23 = load i32, i32* @vkmh, align 4, !dbg !179, !tbaa !40
  %24 = load i32, i32* @RT12, align 4, !dbg !180, !tbaa !40
  %25 = add nsw i32 %23, %24, !dbg !181
  store i32 %25, i32* @vkmh, align 4, !dbg !182, !tbaa !40
  %26 = load i32, i32* @vkmh, align 4, !dbg !183, !tbaa !40
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_P_average_rpm_Gain, align 4, !dbg !184, !tbaa !40
  %28 = add nsw i32 %26, %27, !dbg !185
  store i32 %28, i32* @vkmh, align 4, !dbg !186, !tbaa !40
  %29 = load i32, i32* @vkmh, align 4, !dbg !187, !tbaa !40
  %30 = load i32, i32* @brake_acc_nodiv_ctrl_P_wgrads_Gain, align 4, !dbg !188, !tbaa !40
  %31 = add nsw i32 %29, %30, !dbg !189
  store i32 %31, i32* @vkmh, align 4, !dbg !190, !tbaa !40
  %32 = load i32, i32* @vkmh, align 4, !dbg !191, !tbaa !40
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_P_vkmh_Gain, align 4, !dbg !192, !tbaa !40
  %34 = add nsw i32 %32, %33, !dbg !193
  store i32 %34, i32* @vkmh, align 4, !dbg !194, !tbaa !40
  %35 = load i32, i32* @test, align 4, !dbg !195, !tbaa !40
  %36 = icmp ne i32 %35, 0, !dbg !196
  br i1 %36, label %37, label %38, !dbg !195

37:                                               ; preds = %0
  br label %38, !dbg !197

38:                                               ; preds = %37, %0
  %39 = load i32, i32* @test, align 4, !dbg !198, !tbaa !40
  %40 = icmp ne i32 %39, 1, !dbg !199
  br i1 %40, label %41, label %42, !dbg !198

41:                                               ; preds = %38
  br label %42, !dbg !200

42:                                               ; preds = %41, %38
  %43 = load i32, i32* @test, align 4, !dbg !201, !tbaa !40
  %44 = icmp ne i32 %43, 2, !dbg !202
  br i1 %44, label %45, label %46, !dbg !201

45:                                               ; preds = %42
  br label %46, !dbg !203

46:                                               ; preds = %45, %42
  %47 = load i32, i32* @test, align 4, !dbg !204, !tbaa !40
  %48 = icmp ne i32 %47, 3, !dbg !205
  br i1 %48, label %49, label %50, !dbg !204

49:                                               ; preds = %46
  br label %50, !dbg !206

50:                                               ; preds = %49, %46
  %51 = load i32, i32* @test, align 4, !dbg !207, !tbaa !40
  %52 = icmp sle i32 %51, 0, !dbg !208
  br i1 %52, label %53, label %54, !dbg !207

53:                                               ; preds = %50
  br label %54, !dbg !209

54:                                               ; preds = %53, %50
  %55 = load i32, i32* @test, align 4, !dbg !210, !tbaa !40
  %56 = add nsw i32 %55, 1, !dbg !210
  store i32 %56, i32* @test, align 4, !dbg !210, !tbaa !40
  %57 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain0, align 4, !dbg !211, !tbaa !40
  %58 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !212, !tbaa !40
  %59 = add nsw i32 %57, %58, !dbg !213
  store i32 %59, i32* @RT_Buffer0, align 4, !dbg !214, !tbaa !40
  %60 = load i32, i32* @vkmh, align 4, !dbg !215, !tbaa !40
  store i32 %60, i32* @RT4_Buffer0, align 4, !dbg !216, !tbaa !40
  %61 = load i32, i32* @Distribution_idx, align 4, !dbg !217, !tbaa !40
  store i32 %61, i32* @RT1_Buffer0, align 4, !dbg !218, !tbaa !40
  %62 = load i32, i32* @Distribution_idx_0, align 4, !dbg !219, !tbaa !40
  store i32 %62, i32* @RT2_Buffer0, align 4, !dbg !220, !tbaa !40
  %63 = load i32, i32* @Distribution_idx_1, align 4, !dbg !221, !tbaa !40
  store i32 %63, i32* @RT3_Buffer0, align 4, !dbg !222, !tbaa !40
  ret void, !dbg !223
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #7 !dbg !224 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = load i32, i32* @cnt2, align 4, !dbg !225, !tbaa !40
  %11 = add nsw i32 %10, 1, !dbg !225
  store i32 %11, i32* @cnt2, align 4, !dbg !225, !tbaa !40
  store i32 1, i32* @test, align 4, !dbg !226, !tbaa !40
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !227, !tbaa !40
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !228, !tbaa !40
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !229, !tbaa !40
  store i32 %13, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !230, !tbaa !40
  %14 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !231, !tbaa !40
  store i32 %14, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !232, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !233, !tbaa !40
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !234, !tbaa !40
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !235, !tbaa !40
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !236, !tbaa !40
  %17 = bitcast i32* %1 to i8*, !dbg !237
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #8, !dbg !237
  %18 = load i32, i32* @RT_Buffer0, align 4, !dbg !238, !tbaa !40
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !239, !tbaa !40
  %19 = load i32, i32* @RT4_Buffer0, align 4, !dbg !240, !tbaa !40
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !241, !tbaa !40
  store i32 10, i32* %1, align 4, !dbg !242, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %2) #8, !dbg !243
  %20 = bitcast i32* %3 to i8*, !dbg !244
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #8, !dbg !244
  %21 = bitcast i32* %4 to i8*, !dbg !245
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %21) #8, !dbg !245
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !246, !tbaa !40
  %23 = add nsw i32 10, %22, !dbg !247
  store i32 %23, i32* %3, align 4, !dbg !248, !tbaa !40
  %24 = load i32, i32* %3, align 4, !dbg !249, !tbaa !40
  %25 = add nsw i32 %24, 10, !dbg !250
  store i32 %25, i32* %4, align 4, !dbg !251, !tbaa !40
  %26 = load i32, i32* %4, align 4, !dbg !252, !tbaa !40
  %27 = load i32, i32* %1, align 4, !dbg !253, !tbaa !40
  %28 = add nsw i32 %26, %27, !dbg !254
  store i32 %28, i32* %4, align 4, !dbg !255, !tbaa !40
  %29 = bitcast i32* %5 to i8*, !dbg !256
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %29) #8, !dbg !256
  store i32 100, i32* %5, align 4, !dbg !257, !tbaa !40
  %30 = load i32, i32* %4, align 4, !dbg !258, !tbaa !40
  %31 = load i32, i32* %5, align 4, !dbg !259, !tbaa !40
  %32 = icmp sge i32 %30, %31, !dbg !260
  br i1 %32, label %33, label %34, !dbg !258

33:                                               ; preds = %0
  store i32 100, i32* %4, align 4, !dbg !261, !tbaa !40
  br label %42, !dbg !262

34:                                               ; preds = %0
  %35 = bitcast i32* %6 to i8*, !dbg !263
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %35) #8, !dbg !263
  store i32 5, i32* %6, align 4, !dbg !264, !tbaa !40
  %36 = load i32, i32* %4, align 4, !dbg !265, !tbaa !40
  %37 = load i32, i32* %6, align 4, !dbg !266, !tbaa !40
  %38 = icmp sle i32 %36, %37, !dbg !267
  br i1 %38, label %39, label %40, !dbg !265

39:                                               ; preds = %34
  store i32 5, i32* %4, align 4, !dbg !268, !tbaa !40
  br label %40, !dbg !269

40:                                               ; preds = %39, %34
  %41 = bitcast i32* %6 to i8*, !dbg !270
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #8, !dbg !270
  br label %42

42:                                               ; preds = %40, %33
  %43 = bitcast i32* %7 to i8*, !dbg !271
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %43) #8, !dbg !271
  store i32 10, i32* %7, align 4, !dbg !272, !tbaa !40
  %44 = bitcast i32* %8 to i8*, !dbg !273
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %44) #8, !dbg !273
  %45 = load i32, i32* %3, align 4, !dbg !274, !tbaa !40
  %46 = add nsw i32 10, %45, !dbg !275
  store i32 %46, i32* %8, align 4, !dbg !276, !tbaa !40
  %47 = load i32, i32* %7, align 4, !dbg !277, !tbaa !40
  %48 = load i32, i32* %8, align 4, !dbg !278, !tbaa !40
  %49 = icmp sgt i32 %47, %48, !dbg !279
  br i1 %49, label %50, label %51, !dbg !277

50:                                               ; preds = %42
  store i8 1, i8* %2, align 1, !dbg !280, !tbaa !281
  br label %52, !dbg !283

51:                                               ; preds = %42
  store i8 0, i8* %2, align 1, !dbg !284, !tbaa !281
  br label %52

52:                                               ; preds = %51, %50
  %53 = bitcast i32* %9 to i8*, !dbg !285
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %53) #8, !dbg !285
  store i32 100, i32* %9, align 4, !dbg !286, !tbaa !40
  %54 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !287, !tbaa !40
  %55 = load i32, i32* %9, align 4, !dbg !288, !tbaa !40
  %56 = icmp sge i32 %54, %55, !dbg !289
  br i1 %56, label %57, label %64, !dbg !287

57:                                               ; preds = %52
  %58 = load i8, i8* %2, align 1, !dbg !290, !tbaa !281, !range !291
  %59 = trunc i8 %58 to i1, !dbg !290
  br i1 %59, label %60, label %61, !dbg !290

60:                                               ; preds = %57
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !292, !tbaa !40
  br label %63, !dbg !293

61:                                               ; preds = %57
  %62 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !294, !tbaa !40
  store i32 %62, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !295, !tbaa !40
  br label %63

63:                                               ; preds = %61, %60
  br label %66, !dbg !296

64:                                               ; preds = %52
  %65 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !297, !tbaa !40
  store i32 %65, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !298, !tbaa !40
  br label %66

66:                                               ; preds = %64, %63
  %67 = load i32, i32* @RT1_Buffer0, align 4, !dbg !299, !tbaa !40
  store i32 %67, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !300, !tbaa !40
  %68 = load i32, i32* %1, align 4, !dbg !301, !tbaa !40
  store i32 %68, i32* @RT9, align 4, !dbg !302, !tbaa !40
  %69 = bitcast i32* %9 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %69) #8, !dbg !303
  %70 = bitcast i32* %8 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %70) #8, !dbg !303
  %71 = bitcast i32* %7 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %71) #8, !dbg !303
  %72 = bitcast i32* %5 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #8, !dbg !303
  %73 = bitcast i32* %4 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #8, !dbg !303
  %74 = bitcast i32* %3 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #8, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %2) #8, !dbg !303
  %75 = bitcast i32* %1 to i8*, !dbg !303
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #8, !dbg !303
  ret void, !dbg !303
}

; Function Attrs: nounwind uwtable
define i8* @task_FL_Wheel(i8* %0) #7 !dbg !304 {
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
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %3, align 8, !tbaa !10
  %17 = load i32, i32* @test, align 4, !dbg !305, !tbaa !40
  %18 = add nsw i32 %17, 1, !dbg !305
  store i32 %18, i32* @test, align 4, !dbg !305, !tbaa !40
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !306, !tbaa !40
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !307, !tbaa !40
  %20 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !308, !tbaa !40
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !309, !tbaa !40
  %21 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !310, !tbaa !40
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !311, !tbaa !40
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !312, !tbaa !40
  store i32 %22, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !313, !tbaa !40
  %23 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !314, !tbaa !40
  store i32 %23, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !315, !tbaa !40
  %24 = bitcast i32* %4 to i8*, !dbg !316
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #8, !dbg !316
  store i32 10, i32* %4, align 4, !dbg !317, !tbaa !40
  %25 = load i32, i32* @RT_Buffer0, align 4, !dbg !318, !tbaa !40
  store i32 %25, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !319, !tbaa !40
  %26 = load i32, i32* @RT4_Buffer0, align 4, !dbg !320, !tbaa !40
  store i32 %26, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !321, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #8, !dbg !322
  %27 = bitcast i32* %6 to i8*, !dbg !323
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %27) #8, !dbg !323
  %28 = bitcast i32* %7 to i8*, !dbg !324
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %28) #8, !dbg !324
  %29 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !325, !tbaa !40
  %30 = add nsw i32 10, %29, !dbg !326
  store i32 %30, i32* %6, align 4, !dbg !327, !tbaa !40
  %31 = load i32, i32* %6, align 4, !dbg !328, !tbaa !40
  %32 = add nsw i32 %31, 10, !dbg !329
  store i32 %32, i32* %7, align 4, !dbg !330, !tbaa !40
  %33 = load i32, i32* %7, align 4, !dbg !331, !tbaa !40
  %34 = load i32, i32* %4, align 4, !dbg !332, !tbaa !40
  %35 = add nsw i32 %33, %34, !dbg !333
  store i32 %35, i32* %7, align 4, !dbg !334, !tbaa !40
  %36 = bitcast i32* %8 to i8*, !dbg !335
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %36) #8, !dbg !335
  store i32 100, i32* %8, align 4, !dbg !336, !tbaa !40
  %37 = load i32, i32* %7, align 4, !dbg !337, !tbaa !40
  %38 = load i32, i32* %8, align 4, !dbg !338, !tbaa !40
  %39 = icmp sge i32 %37, %38, !dbg !339
  br i1 %39, label %40, label %41, !dbg !337

40:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !340, !tbaa !40
  br label %49, !dbg !341

41:                                               ; preds = %1
  %42 = bitcast i32* %9 to i8*, !dbg !342
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %42) #8, !dbg !342
  store i32 5, i32* %9, align 4, !dbg !343, !tbaa !40
  %43 = load i32, i32* %7, align 4, !dbg !344, !tbaa !40
  %44 = load i32, i32* %9, align 4, !dbg !345, !tbaa !40
  %45 = icmp sle i32 %43, %44, !dbg !346
  br i1 %45, label %46, label %47, !dbg !344

46:                                               ; preds = %41
  store i32 5, i32* %7, align 4, !dbg !347, !tbaa !40
  br label %47, !dbg !348

47:                                               ; preds = %46, %41
  %48 = bitcast i32* %9 to i8*, !dbg !349
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %48) #8, !dbg !349
  br label %49

49:                                               ; preds = %47, %40
  %50 = bitcast i32* %10 to i8*, !dbg !350
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %50) #8, !dbg !350
  store i32 10, i32* %10, align 4, !dbg !351, !tbaa !40
  %51 = bitcast i32* %11 to i8*, !dbg !352
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %51) #8, !dbg !352
  %52 = load i32, i32* %6, align 4, !dbg !353, !tbaa !40
  %53 = add nsw i32 10, %52, !dbg !354
  store i32 %53, i32* %11, align 4, !dbg !355, !tbaa !40
  %54 = load i32, i32* %10, align 4, !dbg !356, !tbaa !40
  %55 = load i32, i32* %11, align 4, !dbg !357, !tbaa !40
  %56 = icmp sgt i32 %54, %55, !dbg !358
  br i1 %56, label %57, label %58, !dbg !356

57:                                               ; preds = %49
  store i8 1, i8* %5, align 1, !dbg !359, !tbaa !281
  br label %59, !dbg !360

58:                                               ; preds = %49
  store i8 0, i8* %5, align 1, !dbg !361, !tbaa !281
  br label %59

59:                                               ; preds = %58, %57
  %60 = bitcast i32* %12 to i8*, !dbg !362
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %60) #8, !dbg !362
  store i32 100, i32* %12, align 4, !dbg !363, !tbaa !40
  %61 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !364, !tbaa !40
  %62 = load i32, i32* %12, align 4, !dbg !365, !tbaa !40
  %63 = icmp sge i32 %61, %62, !dbg !366
  br i1 %63, label %64, label %71, !dbg !364

64:                                               ; preds = %59
  %65 = load i8, i8* %5, align 1, !dbg !367, !tbaa !281, !range !291
  %66 = trunc i8 %65 to i1, !dbg !367
  br i1 %66, label %67, label %68, !dbg !367

67:                                               ; preds = %64
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !368, !tbaa !40
  br label %70, !dbg !369

68:                                               ; preds = %64
  %69 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !370, !tbaa !40
  store i32 %69, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !371, !tbaa !40
  br label %70

70:                                               ; preds = %68, %67
  br label %73, !dbg !372

71:                                               ; preds = %59
  %72 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !373, !tbaa !40
  store i32 %72, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !374, !tbaa !40
  br label %73

73:                                               ; preds = %71, %70
  %74 = bitcast i32* %13 to i8*, !dbg !375
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %74) #8, !dbg !375
  %75 = load i8, i8* %5, align 1, !dbg !376, !tbaa !281, !range !291
  %76 = trunc i8 %75 to i1, !dbg !376
  br i1 %76, label %77, label %78, !dbg !376

77:                                               ; preds = %73
  store i32 15, i32* %13, align 4, !dbg !377, !tbaa !40
  br label %79, !dbg !378

78:                                               ; preds = %73
  store i32 65, i32* %13, align 4, !dbg !379, !tbaa !40
  br label %79

79:                                               ; preds = %78, %77
  %80 = bitcast i32* %14 to i8*, !dbg !380
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %80) #8, !dbg !380
  store i32 50, i32* %14, align 4, !dbg !381, !tbaa !40
  %81 = bitcast i32* %15 to i8*, !dbg !382
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %81) #8, !dbg !382
  store i32 20, i32* %15, align 4, !dbg !383, !tbaa !40
  %82 = bitcast i32* %16 to i8*, !dbg !384
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %82) #8, !dbg !384
  %83 = load i32, i32* %13, align 4, !dbg !385, !tbaa !40
  %84 = load i32, i32* %14, align 4, !dbg !386, !tbaa !40
  %85 = icmp sge i32 %83, %84, !dbg !387
  br i1 %85, label %86, label %87, !dbg !385

86:                                               ; preds = %79
  store i32 50, i32* %16, align 4, !dbg !388, !tbaa !40
  br label %87, !dbg !389

87:                                               ; preds = %86, %79
  %88 = load i32, i32* %13, align 4, !dbg !390, !tbaa !40
  %89 = load i32, i32* %15, align 4, !dbg !391, !tbaa !40
  %90 = icmp sle i32 %88, %89, !dbg !392
  br i1 %90, label %91, label %92, !dbg !390

91:                                               ; preds = %87
  store i32 20, i32* %16, align 4, !dbg !393, !tbaa !40
  br label %93, !dbg !394

92:                                               ; preds = %87
  store i32 15, i32* %16, align 4, !dbg !395, !tbaa !40
  br label %93

93:                                               ; preds = %92, %91
  %94 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !396, !tbaa !40
  %95 = load i32, i32* %16, align 4, !dbg !397, !tbaa !40
  %96 = add nsw i32 %94, %95, !dbg !398
  store i32 %96, i32* @RT14, align 4, !dbg !399, !tbaa !40
  %97 = load i32, i32* %4, align 4, !dbg !400, !tbaa !40
  store i32 %97, i32* @RT12, align 4, !dbg !401, !tbaa !40
  %98 = bitcast i32* %16 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %98) #8, !dbg !402
  %99 = bitcast i32* %15 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %99) #8, !dbg !402
  %100 = bitcast i32* %14 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %100) #8, !dbg !402
  %101 = bitcast i32* %13 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %101) #8, !dbg !402
  %102 = bitcast i32* %12 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %102) #8, !dbg !402
  %103 = bitcast i32* %11 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %103) #8, !dbg !402
  %104 = bitcast i32* %10 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %104) #8, !dbg !402
  %105 = bitcast i32* %8 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %105) #8, !dbg !402
  %106 = bitcast i32* %7 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %106) #8, !dbg !402
  %107 = bitcast i32* %6 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %107) #8, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #8, !dbg !402
  %108 = bitcast i32* %4 to i8*, !dbg !402
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %108) #8, !dbg !402
  %109 = load i8*, i8** %2, align 8, !dbg !402
  ret i8* %109, !dbg !402
}

; Function Attrs: nounwind uwtable
define i8* @task_FR_Wheel(i8* %0) #7 !dbg !403 {
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
  %13 = load i32, i32* @test, align 4, !dbg !404, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !404
  store i32 %14, i32* @test, align 4, !dbg !404, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !405, !tbaa !40
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !406, !tbaa !40
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !407, !tbaa !40
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !408, !tbaa !40
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !409, !tbaa !40
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !410, !tbaa !40
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !411, !tbaa !40
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !412, !tbaa !40
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !413, !tbaa !40
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !414, !tbaa !40
  %20 = bitcast i32* %4 to i8*, !dbg !415
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #8, !dbg !415
  %21 = load i32, i32* @RT4_Buffer0, align 4, !dbg !416, !tbaa !40
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !417, !tbaa !40
  store i32 10, i32* %4, align 4, !dbg !418, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #8, !dbg !419
  %22 = bitcast i32* %6 to i8*, !dbg !420
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %22) #8, !dbg !420
  %23 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !421, !tbaa !40
  %24 = add nsw i32 10, %23, !dbg !422
  store i32 %24, i32* %6, align 4, !dbg !423, !tbaa !40
  %25 = bitcast i32* %7 to i8*, !dbg !424
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %25) #8, !dbg !424
  %26 = load i32, i32* %6, align 4, !dbg !425, !tbaa !40
  %27 = add nsw i32 %26, 10, !dbg !426
  store i32 %27, i32* %7, align 4, !dbg !427, !tbaa !40
  %28 = load i32, i32* %7, align 4, !dbg !428, !tbaa !40
  %29 = load i32, i32* %4, align 4, !dbg !429, !tbaa !40
  %30 = add nsw i32 %28, %29, !dbg !430
  store i32 %30, i32* %7, align 4, !dbg !431, !tbaa !40
  %31 = bitcast i32* %8 to i8*, !dbg !432
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %31) #8, !dbg !432
  store i32 100, i32* %8, align 4, !dbg !433, !tbaa !40
  %32 = load i32, i32* %7, align 4, !dbg !434, !tbaa !40
  %33 = load i32, i32* %8, align 4, !dbg !435, !tbaa !40
  %34 = icmp sge i32 %32, %33, !dbg !436
  br i1 %34, label %35, label %36, !dbg !434

35:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !437, !tbaa !40
  br label %44, !dbg !438

36:                                               ; preds = %1
  %37 = bitcast i32* %9 to i8*, !dbg !439
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %37) #8, !dbg !439
  store i32 5, i32* %9, align 4, !dbg !440, !tbaa !40
  %38 = load i32, i32* %7, align 4, !dbg !441, !tbaa !40
  %39 = load i32, i32* %9, align 4, !dbg !442, !tbaa !40
  %40 = icmp sle i32 %38, %39, !dbg !443
  br i1 %40, label %41, label %42, !dbg !441

41:                                               ; preds = %36
  store i32 5, i32* %7, align 4, !dbg !444, !tbaa !40
  br label %42, !dbg !445

42:                                               ; preds = %41, %36
  %43 = bitcast i32* %9 to i8*, !dbg !446
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #8, !dbg !446
  br label %44

44:                                               ; preds = %42, %35
  %45 = bitcast i32* %10 to i8*, !dbg !447
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %45) #8, !dbg !447
  store i32 10, i32* %10, align 4, !dbg !448, !tbaa !40
  %46 = bitcast i32* %11 to i8*, !dbg !449
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %46) #8, !dbg !449
  %47 = load i32, i32* %6, align 4, !dbg !450, !tbaa !40
  %48 = add nsw i32 10, %47, !dbg !451
  store i32 %48, i32* %11, align 4, !dbg !452, !tbaa !40
  %49 = load i32, i32* %10, align 4, !dbg !453, !tbaa !40
  %50 = load i32, i32* %11, align 4, !dbg !454, !tbaa !40
  %51 = icmp sgt i32 %49, %50, !dbg !455
  br i1 %51, label %52, label %53, !dbg !453

52:                                               ; preds = %44
  store i8 1, i8* %5, align 1, !dbg !456, !tbaa !281
  br label %54, !dbg !457

53:                                               ; preds = %44
  store i8 0, i8* %5, align 1, !dbg !458, !tbaa !281
  br label %54

54:                                               ; preds = %53, %52
  %55 = bitcast i32* %12 to i8*, !dbg !459
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %55) #8, !dbg !459
  store i32 100, i32* %12, align 4, !dbg !460, !tbaa !40
  %56 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !461, !tbaa !40
  %57 = load i32, i32* %12, align 4, !dbg !462, !tbaa !40
  %58 = icmp sge i32 %56, %57, !dbg !463
  br i1 %58, label %59, label %66, !dbg !461

59:                                               ; preds = %54
  %60 = load i8, i8* %5, align 1, !dbg !464, !tbaa !281, !range !291
  %61 = trunc i8 %60 to i1, !dbg !464
  br i1 %61, label %62, label %63, !dbg !464

62:                                               ; preds = %59
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !465, !tbaa !40
  br label %65, !dbg !466

63:                                               ; preds = %59
  %64 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !467, !tbaa !40
  store i32 %64, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !468, !tbaa !40
  br label %65

65:                                               ; preds = %63, %62
  br label %68, !dbg !469

66:                                               ; preds = %54
  %67 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !470, !tbaa !40
  store i32 %67, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !471, !tbaa !40
  br label %68

68:                                               ; preds = %66, %65
  %69 = load i32, i32* @RT3_Buffer0, align 4, !dbg !472, !tbaa !40
  store i32 %69, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !473, !tbaa !40
  %70 = load i32, i32* %4, align 4, !dbg !474, !tbaa !40
  store i32 %70, i32* @RT11, align 4, !dbg !475, !tbaa !40
  %71 = bitcast i32* %12 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %71) #8, !dbg !476
  %72 = bitcast i32* %11 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #8, !dbg !476
  %73 = bitcast i32* %10 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #8, !dbg !476
  %74 = bitcast i32* %8 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #8, !dbg !476
  %75 = bitcast i32* %7 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #8, !dbg !476
  %76 = bitcast i32* %6 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #8, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #8, !dbg !476
  %77 = bitcast i32* %4 to i8*, !dbg !476
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #8, !dbg !476
  %78 = load i8*, i8** %2, align 8, !dbg !476
  ret i8* %78, !dbg !476
}

; Function Attrs: nounwind uwtable
define i8* @task_RL_Wheel(i8* %0) #7 !dbg !477 {
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
  %13 = load i32, i32* @test, align 4, !dbg !478, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !478
  store i32 %14, i32* @test, align 4, !dbg !478, !tbaa !40
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !479, !tbaa !40
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !480, !tbaa !40
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !481, !tbaa !40
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !482, !tbaa !40
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !483, !tbaa !40
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !484, !tbaa !40
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !485, !tbaa !40
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !486, !tbaa !40
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !487, !tbaa !40
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !488, !tbaa !40
  %20 = bitcast i32* %4 to i8*, !dbg !489
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #8, !dbg !489
  %21 = load i32, i32* @RT_Buffer0, align 4, !dbg !490, !tbaa !40
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !491, !tbaa !40
  %22 = load i32, i32* @RT4_Buffer0, align 4, !dbg !492, !tbaa !40
  store i32 %22, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !493, !tbaa !40
  store i32 10, i32* %4, align 4, !dbg !494, !tbaa !40
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %5) #8, !dbg !495
  %23 = bitcast i32* %6 to i8*, !dbg !496
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #8, !dbg !496
  %24 = bitcast i32* %7 to i8*, !dbg !497
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #8, !dbg !497
  %25 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !498, !tbaa !40
  %26 = add nsw i32 10, %25, !dbg !499
  store i32 %26, i32* %6, align 4, !dbg !500, !tbaa !40
  %27 = load i32, i32* %6, align 4, !dbg !501, !tbaa !40
  %28 = add nsw i32 %27, 10, !dbg !502
  store i32 %28, i32* %7, align 4, !dbg !503, !tbaa !40
  %29 = load i32, i32* %7, align 4, !dbg !504, !tbaa !40
  %30 = load i32, i32* %4, align 4, !dbg !505, !tbaa !40
  %31 = add nsw i32 %29, %30, !dbg !506
  store i32 %31, i32* %7, align 4, !dbg !507, !tbaa !40
  %32 = bitcast i32* %8 to i8*, !dbg !508
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %32) #8, !dbg !508
  store i32 100, i32* %8, align 4, !dbg !509, !tbaa !40
  %33 = load i32, i32* %7, align 4, !dbg !510, !tbaa !40
  %34 = load i32, i32* %8, align 4, !dbg !511, !tbaa !40
  %35 = icmp sge i32 %33, %34, !dbg !512
  br i1 %35, label %36, label %37, !dbg !510

36:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !513, !tbaa !40
  br label %45, !dbg !514

37:                                               ; preds = %1
  %38 = bitcast i32* %9 to i8*, !dbg !515
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %38) #8, !dbg !515
  store i32 5, i32* %9, align 4, !dbg !516, !tbaa !40
  %39 = load i32, i32* %7, align 4, !dbg !517, !tbaa !40
  %40 = load i32, i32* %9, align 4, !dbg !518, !tbaa !40
  %41 = icmp sle i32 %39, %40, !dbg !519
  br i1 %41, label %42, label %43, !dbg !517

42:                                               ; preds = %37
  store i32 5, i32* %7, align 4, !dbg !520, !tbaa !40
  br label %43, !dbg !521

43:                                               ; preds = %42, %37
  %44 = bitcast i32* %9 to i8*, !dbg !522
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #8, !dbg !522
  br label %45

45:                                               ; preds = %43, %36
  %46 = bitcast i32* %10 to i8*, !dbg !523
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %46) #8, !dbg !523
  store i32 10, i32* %10, align 4, !dbg !524, !tbaa !40
  %47 = bitcast i32* %11 to i8*, !dbg !525
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %47) #8, !dbg !525
  %48 = load i32, i32* %6, align 4, !dbg !526, !tbaa !40
  %49 = add nsw i32 10, %48, !dbg !527
  store i32 %49, i32* %11, align 4, !dbg !528, !tbaa !40
  %50 = load i32, i32* %10, align 4, !dbg !529, !tbaa !40
  %51 = load i32, i32* %11, align 4, !dbg !530, !tbaa !40
  %52 = icmp sgt i32 %50, %51, !dbg !531
  br i1 %52, label %53, label %54, !dbg !529

53:                                               ; preds = %45
  store i8 1, i8* %5, align 1, !dbg !532, !tbaa !281
  br label %55, !dbg !533

54:                                               ; preds = %45
  store i8 0, i8* %5, align 1, !dbg !534, !tbaa !281
  br label %55

55:                                               ; preds = %54, %53
  %56 = bitcast i32* %12 to i8*, !dbg !535
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %56) #8, !dbg !535
  store i32 100, i32* %12, align 4, !dbg !536, !tbaa !40
  %57 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !537, !tbaa !40
  %58 = load i32, i32* %12, align 4, !dbg !538, !tbaa !40
  %59 = icmp sge i32 %57, %58, !dbg !539
  br i1 %59, label %60, label %67, !dbg !537

60:                                               ; preds = %55
  %61 = load i8, i8* %5, align 1, !dbg !540, !tbaa !281, !range !291
  %62 = trunc i8 %61 to i1, !dbg !540
  br i1 %62, label %63, label %64, !dbg !540

63:                                               ; preds = %60
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !541, !tbaa !40
  br label %66, !dbg !542

64:                                               ; preds = %60
  %65 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !543, !tbaa !40
  store i32 %65, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !544, !tbaa !40
  br label %66

66:                                               ; preds = %64, %63
  br label %69, !dbg !545

67:                                               ; preds = %55
  %68 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !546, !tbaa !40
  store i32 %68, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !547, !tbaa !40
  br label %69

69:                                               ; preds = %67, %66
  %70 = load i32, i32* @RT2_Buffer0, align 4, !dbg !548, !tbaa !40
  store i32 %70, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !549, !tbaa !40
  %71 = load i32, i32* %4, align 4, !dbg !550, !tbaa !40
  store i32 %71, i32* @RT10, align 4, !dbg !551, !tbaa !40
  %72 = bitcast i32* %12 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #8, !dbg !552
  %73 = bitcast i32* %11 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #8, !dbg !552
  %74 = bitcast i32* %10 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #8, !dbg !552
  %75 = bitcast i32* %8 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #8, !dbg !552
  %76 = bitcast i32* %7 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #8, !dbg !552
  %77 = bitcast i32* %6 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #8, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %5) #8, !dbg !552
  %78 = bitcast i32* %4 to i8*, !dbg !552
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %78) #8, !dbg !552
  %79 = load i8*, i8** %2, align 8, !dbg !552
  ret i8* %79, !dbg !552
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_004_001_main() #7 !dbg !553 {
  store i32 0, i32* @test, align 4, !dbg !554, !tbaa !40
  ret i32 0, !dbg !555
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
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake/brake1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/brake")
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
!146 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 142, type: !9, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!147 = !DILocation(line: 145, column: 13, scope: !146)
!148 = !DILocation(line: 149, column: 45, scope: !146)
!149 = !DILocation(line: 149, column: 43, scope: !146)
!150 = !DILocation(line: 152, column: 44, scope: !146)
!151 = !DILocation(line: 152, column: 42, scope: !146)
!152 = !DILocation(line: 155, column: 44, scope: !146)
!153 = !DILocation(line: 155, column: 42, scope: !146)
!154 = !DILocation(line: 158, column: 44, scope: !146)
!155 = !DILocation(line: 158, column: 42, scope: !146)
!156 = !DILocation(line: 161, column: 44, scope: !146)
!157 = !DILocation(line: 161, column: 42, scope: !146)
!158 = !DILocation(line: 164, column: 14, scope: !146)
!159 = !DILocation(line: 172, column: 28, scope: !146)
!160 = !DILocation(line: 173, column: 13, scope: !146)
!161 = !DILocation(line: 172, column: 70, scope: !146)
!162 = !DILocation(line: 172, column: 26, scope: !146)
!163 = !DILocation(line: 174, column: 30, scope: !146)
!164 = !DILocation(line: 175, column: 13, scope: !146)
!165 = !DILocation(line: 174, column: 72, scope: !146)
!166 = !DILocation(line: 174, column: 28, scope: !146)
!167 = !DILocation(line: 176, column: 30, scope: !146)
!168 = !DILocation(line: 177, column: 13, scope: !146)
!169 = !DILocation(line: 176, column: 72, scope: !146)
!170 = !DILocation(line: 176, column: 28, scope: !146)
!171 = !DILocation(line: 191, column: 16, scope: !146)
!172 = !DILocation(line: 191, column: 20, scope: !146)
!173 = !DILocation(line: 191, column: 19, scope: !146)
!174 = !DILocation(line: 191, column: 14, scope: !146)
!175 = !DILocation(line: 192, column: 16, scope: !146)
!176 = !DILocation(line: 192, column: 23, scope: !146)
!177 = !DILocation(line: 192, column: 21, scope: !146)
!178 = !DILocation(line: 192, column: 14, scope: !146)
!179 = !DILocation(line: 193, column: 16, scope: !146)
!180 = !DILocation(line: 193, column: 23, scope: !146)
!181 = !DILocation(line: 193, column: 21, scope: !146)
!182 = !DILocation(line: 193, column: 14, scope: !146)
!183 = !DILocation(line: 194, column: 16, scope: !146)
!184 = !DILocation(line: 194, column: 23, scope: !146)
!185 = !DILocation(line: 194, column: 21, scope: !146)
!186 = !DILocation(line: 194, column: 14, scope: !146)
!187 = !DILocation(line: 195, column: 16, scope: !146)
!188 = !DILocation(line: 195, column: 23, scope: !146)
!189 = !DILocation(line: 195, column: 21, scope: !146)
!190 = !DILocation(line: 195, column: 14, scope: !146)
!191 = !DILocation(line: 196, column: 16, scope: !146)
!192 = !DILocation(line: 196, column: 23, scope: !146)
!193 = !DILocation(line: 196, column: 21, scope: !146)
!194 = !DILocation(line: 196, column: 14, scope: !146)
!195 = !DILocation(line: 199, column: 13, scope: !146)
!196 = !DILocation(line: 199, column: 18, scope: !146)
!197 = !DILocation(line: 201, column: 9, scope: !146)
!198 = !DILocation(line: 203, column: 13, scope: !146)
!199 = !DILocation(line: 203, column: 18, scope: !146)
!200 = !DILocation(line: 205, column: 9, scope: !146)
!201 = !DILocation(line: 207, column: 13, scope: !146)
!202 = !DILocation(line: 207, column: 18, scope: !146)
!203 = !DILocation(line: 209, column: 9, scope: !146)
!204 = !DILocation(line: 211, column: 13, scope: !146)
!205 = !DILocation(line: 211, column: 18, scope: !146)
!206 = !DILocation(line: 213, column: 9, scope: !146)
!207 = !DILocation(line: 215, column: 13, scope: !146)
!208 = !DILocation(line: 215, column: 18, scope: !146)
!209 = !DILocation(line: 217, column: 9, scope: !146)
!210 = !DILocation(line: 219, column: 13, scope: !146)
!211 = !DILocation(line: 233, column: 22, scope: !146)
!212 = !DILocation(line: 233, column: 66, scope: !146)
!213 = !DILocation(line: 233, column: 64, scope: !146)
!214 = !DILocation(line: 233, column: 20, scope: !146)
!215 = !DILocation(line: 236, column: 23, scope: !146)
!216 = !DILocation(line: 236, column: 21, scope: !146)
!217 = !DILocation(line: 239, column: 23, scope: !146)
!218 = !DILocation(line: 239, column: 21, scope: !146)
!219 = !DILocation(line: 242, column: 23, scope: !146)
!220 = !DILocation(line: 242, column: 21, scope: !146)
!221 = !DILocation(line: 245, column: 23, scope: !146)
!222 = !DILocation(line: 245, column: 21, scope: !146)
!223 = !DILocation(line: 249, column: 1, scope: !146)
!224 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 251, type: !9, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!225 = !DILocation(line: 256, column: 13, scope: !224)
!226 = !DILocation(line: 257, column: 14, scope: !224)
!227 = !DILocation(line: 259, column: 45, scope: !224)
!228 = !DILocation(line: 259, column: 43, scope: !224)
!229 = !DILocation(line: 261, column: 44, scope: !224)
!230 = !DILocation(line: 261, column: 42, scope: !224)
!231 = !DILocation(line: 263, column: 44, scope: !224)
!232 = !DILocation(line: 263, column: 42, scope: !224)
!233 = !DILocation(line: 265, column: 44, scope: !224)
!234 = !DILocation(line: 265, column: 42, scope: !224)
!235 = !DILocation(line: 267, column: 44, scope: !224)
!236 = !DILocation(line: 267, column: 42, scope: !224)
!237 = !DILocation(line: 273, column: 9, scope: !224)
!238 = !DILocation(line: 275, column: 45, scope: !224)
!239 = !DILocation(line: 275, column: 43, scope: !224)
!240 = !DILocation(line: 277, column: 44, scope: !224)
!241 = !DILocation(line: 277, column: 42, scope: !224)
!242 = !DILocation(line: 279, column: 20, scope: !224)
!243 = !DILocation(line: 281, column: 9, scope: !224)
!244 = !DILocation(line: 282, column: 9, scope: !224)
!245 = !DILocation(line: 283, column: 9, scope: !224)
!246 = !DILocation(line: 284, column: 66, scope: !224)
!247 = !DILocation(line: 284, column: 64, scope: !224)
!248 = !DILocation(line: 284, column: 17, scope: !224)
!249 = !DILocation(line: 286, column: 13, scope: !224)
!250 = !DILocation(line: 286, column: 21, scope: !224)
!251 = !DILocation(line: 286, column: 11, scope: !224)
!252 = !DILocation(line: 287, column: 13, scope: !224)
!253 = !DILocation(line: 287, column: 17, scope: !224)
!254 = !DILocation(line: 287, column: 15, scope: !224)
!255 = !DILocation(line: 287, column: 11, scope: !224)
!256 = !DILocation(line: 289, column: 9, scope: !224)
!257 = !DILocation(line: 289, column: 13, scope: !224)
!258 = !DILocation(line: 291, column: 13, scope: !224)
!259 = !DILocation(line: 291, column: 18, scope: !224)
!260 = !DILocation(line: 291, column: 15, scope: !224)
!261 = !DILocation(line: 292, column: 15, scope: !224)
!262 = !DILocation(line: 293, column: 9, scope: !224)
!263 = !DILocation(line: 294, column: 13, scope: !224)
!264 = !DILocation(line: 294, column: 17, scope: !224)
!265 = !DILocation(line: 295, column: 17, scope: !224)
!266 = !DILocation(line: 295, column: 22, scope: !224)
!267 = !DILocation(line: 295, column: 19, scope: !224)
!268 = !DILocation(line: 296, column: 19, scope: !224)
!269 = !DILocation(line: 297, column: 13, scope: !224)
!270 = !DILocation(line: 298, column: 9, scope: !224)
!271 = !DILocation(line: 306, column: 9, scope: !224)
!272 = !DILocation(line: 306, column: 13, scope: !224)
!273 = !DILocation(line: 308, column: 9, scope: !224)
!274 = !DILocation(line: 308, column: 84, scope: !224)
!275 = !DILocation(line: 308, column: 82, scope: !224)
!276 = !DILocation(line: 308, column: 13, scope: !224)
!277 = !DILocation(line: 309, column: 13, scope: !224)
!278 = !DILocation(line: 309, column: 20, scope: !224)
!279 = !DILocation(line: 309, column: 18, scope: !224)
!280 = !DILocation(line: 310, column: 36, scope: !224)
!281 = !{!282, !282, i64 0}
!282 = !{!"_Bool", !12, i64 0}
!283 = !DILocation(line: 311, column: 9, scope: !224)
!284 = !DILocation(line: 312, column: 36, scope: !224)
!285 = !DILocation(line: 316, column: 9, scope: !224)
!286 = !DILocation(line: 316, column: 13, scope: !224)
!287 = !DILocation(line: 317, column: 13, scope: !224)
!288 = !DILocation(line: 317, column: 49, scope: !224)
!289 = !DILocation(line: 317, column: 46, scope: !224)
!290 = !DILocation(line: 323, column: 17, scope: !224)
!291 = !{i8 0, i8 2}
!292 = !DILocation(line: 324, column: 75, scope: !224)
!293 = !DILocation(line: 325, column: 13, scope: !224)
!294 = !DILocation(line: 326, column: 77, scope: !224)
!295 = !DILocation(line: 326, column: 75, scope: !224)
!296 = !DILocation(line: 329, column: 9, scope: !224)
!297 = !DILocation(line: 332, column: 73, scope: !224)
!298 = !DILocation(line: 332, column: 71, scope: !224)
!299 = !DILocation(line: 341, column: 44, scope: !224)
!300 = !DILocation(line: 341, column: 42, scope: !224)
!301 = !DILocation(line: 349, column: 15, scope: !224)
!302 = !DILocation(line: 349, column: 13, scope: !224)
!303 = !DILocation(line: 351, column: 5, scope: !224)
!304 = distinct !DISubprogram(name: "task_FL_Wheel", scope: !1, file: !1, line: 353, type: !9, scopeLine: 353, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!305 = !DILocation(line: 354, column: 14, scope: !304)
!306 = !DILocation(line: 357, column: 45, scope: !304)
!307 = !DILocation(line: 357, column: 43, scope: !304)
!308 = !DILocation(line: 359, column: 44, scope: !304)
!309 = !DILocation(line: 359, column: 42, scope: !304)
!310 = !DILocation(line: 361, column: 44, scope: !304)
!311 = !DILocation(line: 361, column: 42, scope: !304)
!312 = !DILocation(line: 363, column: 44, scope: !304)
!313 = !DILocation(line: 363, column: 42, scope: !304)
!314 = !DILocation(line: 365, column: 44, scope: !304)
!315 = !DILocation(line: 365, column: 42, scope: !304)
!316 = !DILocation(line: 366, column: 9, scope: !304)
!317 = !DILocation(line: 371, column: 17, scope: !304)
!318 = !DILocation(line: 373, column: 45, scope: !304)
!319 = !DILocation(line: 373, column: 43, scope: !304)
!320 = !DILocation(line: 375, column: 40, scope: !304)
!321 = !DILocation(line: 375, column: 38, scope: !304)
!322 = !DILocation(line: 386, column: 5, scope: !304)
!323 = !DILocation(line: 387, column: 5, scope: !304)
!324 = !DILocation(line: 388, column: 5, scope: !304)
!325 = !DILocation(line: 391, column: 62, scope: !304)
!326 = !DILocation(line: 391, column: 60, scope: !304)
!327 = !DILocation(line: 391, column: 13, scope: !304)
!328 = !DILocation(line: 395, column: 9, scope: !304)
!329 = !DILocation(line: 395, column: 17, scope: !304)
!330 = !DILocation(line: 395, column: 7, scope: !304)
!331 = !DILocation(line: 396, column: 9, scope: !304)
!332 = !DILocation(line: 396, column: 13, scope: !304)
!333 = !DILocation(line: 396, column: 11, scope: !304)
!334 = !DILocation(line: 396, column: 7, scope: !304)
!335 = !DILocation(line: 399, column: 5, scope: !304)
!336 = !DILocation(line: 399, column: 9, scope: !304)
!337 = !DILocation(line: 401, column: 9, scope: !304)
!338 = !DILocation(line: 401, column: 14, scope: !304)
!339 = !DILocation(line: 401, column: 11, scope: !304)
!340 = !DILocation(line: 402, column: 11, scope: !304)
!341 = !DILocation(line: 403, column: 5, scope: !304)
!342 = !DILocation(line: 405, column: 9, scope: !304)
!343 = !DILocation(line: 405, column: 13, scope: !304)
!344 = !DILocation(line: 406, column: 13, scope: !304)
!345 = !DILocation(line: 406, column: 18, scope: !304)
!346 = !DILocation(line: 406, column: 15, scope: !304)
!347 = !DILocation(line: 407, column: 15, scope: !304)
!348 = !DILocation(line: 408, column: 9, scope: !304)
!349 = !DILocation(line: 409, column: 5, scope: !304)
!350 = !DILocation(line: 417, column: 5, scope: !304)
!351 = !DILocation(line: 417, column: 9, scope: !304)
!352 = !DILocation(line: 418, column: 5, scope: !304)
!353 = !DILocation(line: 418, column: 80, scope: !304)
!354 = !DILocation(line: 418, column: 78, scope: !304)
!355 = !DILocation(line: 418, column: 9, scope: !304)
!356 = !DILocation(line: 419, column: 9, scope: !304)
!357 = !DILocation(line: 419, column: 16, scope: !304)
!358 = !DILocation(line: 419, column: 14, scope: !304)
!359 = !DILocation(line: 420, column: 32, scope: !304)
!360 = !DILocation(line: 421, column: 5, scope: !304)
!361 = !DILocation(line: 422, column: 32, scope: !304)
!362 = !DILocation(line: 426, column: 5, scope: !304)
!363 = !DILocation(line: 426, column: 9, scope: !304)
!364 = !DILocation(line: 427, column: 9, scope: !304)
!365 = !DILocation(line: 427, column: 45, scope: !304)
!366 = !DILocation(line: 427, column: 42, scope: !304)
!367 = !DILocation(line: 432, column: 13, scope: !304)
!368 = !DILocation(line: 433, column: 71, scope: !304)
!369 = !DILocation(line: 434, column: 9, scope: !304)
!370 = !DILocation(line: 435, column: 73, scope: !304)
!371 = !DILocation(line: 435, column: 71, scope: !304)
!372 = !DILocation(line: 438, column: 5, scope: !304)
!373 = !DILocation(line: 441, column: 69, scope: !304)
!374 = !DILocation(line: 441, column: 67, scope: !304)
!375 = !DILocation(line: 453, column: 5, scope: !304)
!376 = !DILocation(line: 454, column: 9, scope: !304)
!377 = !DILocation(line: 455, column: 23, scope: !304)
!378 = !DILocation(line: 456, column: 5, scope: !304)
!379 = !DILocation(line: 457, column: 23, scope: !304)
!380 = !DILocation(line: 459, column: 5, scope: !304)
!381 = !DILocation(line: 459, column: 9, scope: !304)
!382 = !DILocation(line: 460, column: 5, scope: !304)
!383 = !DILocation(line: 460, column: 9, scope: !304)
!384 = !DILocation(line: 461, column: 5, scope: !304)
!385 = !DILocation(line: 462, column: 9, scope: !304)
!386 = !DILocation(line: 462, column: 26, scope: !304)
!387 = !DILocation(line: 462, column: 23, scope: !304)
!388 = !DILocation(line: 463, column: 13, scope: !304)
!389 = !DILocation(line: 464, column: 5, scope: !304)
!390 = !DILocation(line: 465, column: 9, scope: !304)
!391 = !DILocation(line: 465, column: 26, scope: !304)
!392 = !DILocation(line: 465, column: 23, scope: !304)
!393 = !DILocation(line: 466, column: 13, scope: !304)
!394 = !DILocation(line: 467, column: 5, scope: !304)
!395 = !DILocation(line: 468, column: 13, scope: !304)
!396 = !DILocation(line: 474, column: 12, scope: !304)
!397 = !DILocation(line: 474, column: 48, scope: !304)
!398 = !DILocation(line: 474, column: 46, scope: !304)
!399 = !DILocation(line: 474, column: 10, scope: !304)
!400 = !DILocation(line: 476, column: 12, scope: !304)
!401 = !DILocation(line: 476, column: 10, scope: !304)
!402 = !DILocation(line: 477, column: 1, scope: !304)
!403 = distinct !DISubprogram(name: "task_FR_Wheel", scope: !1, file: !1, line: 479, type: !9, scopeLine: 480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!404 = !DILocation(line: 481, column: 10, scope: !403)
!405 = !DILocation(line: 484, column: 41, scope: !403)
!406 = !DILocation(line: 484, column: 39, scope: !403)
!407 = !DILocation(line: 486, column: 40, scope: !403)
!408 = !DILocation(line: 486, column: 38, scope: !403)
!409 = !DILocation(line: 488, column: 40, scope: !403)
!410 = !DILocation(line: 488, column: 38, scope: !403)
!411 = !DILocation(line: 490, column: 40, scope: !403)
!412 = !DILocation(line: 490, column: 38, scope: !403)
!413 = !DILocation(line: 492, column: 40, scope: !403)
!414 = !DILocation(line: 492, column: 38, scope: !403)
!415 = !DILocation(line: 496, column: 5, scope: !403)
!416 = !DILocation(line: 498, column: 40, scope: !403)
!417 = !DILocation(line: 498, column: 38, scope: !403)
!418 = !DILocation(line: 503, column: 15, scope: !403)
!419 = !DILocation(line: 514, column: 5, scope: !403)
!420 = !DILocation(line: 517, column: 5, scope: !403)
!421 = !DILocation(line: 517, column: 66, scope: !403)
!422 = !DILocation(line: 517, column: 64, scope: !403)
!423 = !DILocation(line: 517, column: 9, scope: !403)
!424 = !DILocation(line: 521, column: 5, scope: !403)
!425 = !DILocation(line: 521, column: 13, scope: !403)
!426 = !DILocation(line: 521, column: 21, scope: !403)
!427 = !DILocation(line: 521, column: 9, scope: !403)
!428 = !DILocation(line: 522, column: 9, scope: !403)
!429 = !DILocation(line: 522, column: 13, scope: !403)
!430 = !DILocation(line: 522, column: 11, scope: !403)
!431 = !DILocation(line: 522, column: 7, scope: !403)
!432 = !DILocation(line: 525, column: 5, scope: !403)
!433 = !DILocation(line: 525, column: 9, scope: !403)
!434 = !DILocation(line: 526, column: 9, scope: !403)
!435 = !DILocation(line: 526, column: 14, scope: !403)
!436 = !DILocation(line: 526, column: 11, scope: !403)
!437 = !DILocation(line: 527, column: 11, scope: !403)
!438 = !DILocation(line: 528, column: 5, scope: !403)
!439 = !DILocation(line: 530, column: 9, scope: !403)
!440 = !DILocation(line: 530, column: 13, scope: !403)
!441 = !DILocation(line: 531, column: 13, scope: !403)
!442 = !DILocation(line: 531, column: 18, scope: !403)
!443 = !DILocation(line: 531, column: 15, scope: !403)
!444 = !DILocation(line: 532, column: 15, scope: !403)
!445 = !DILocation(line: 533, column: 9, scope: !403)
!446 = !DILocation(line: 534, column: 5, scope: !403)
!447 = !DILocation(line: 543, column: 5, scope: !403)
!448 = !DILocation(line: 543, column: 9, scope: !403)
!449 = !DILocation(line: 544, column: 5, scope: !403)
!450 = !DILocation(line: 544, column: 80, scope: !403)
!451 = !DILocation(line: 544, column: 78, scope: !403)
!452 = !DILocation(line: 544, column: 9, scope: !403)
!453 = !DILocation(line: 545, column: 9, scope: !403)
!454 = !DILocation(line: 545, column: 16, scope: !403)
!455 = !DILocation(line: 545, column: 14, scope: !403)
!456 = !DILocation(line: 546, column: 32, scope: !403)
!457 = !DILocation(line: 547, column: 5, scope: !403)
!458 = !DILocation(line: 548, column: 32, scope: !403)
!459 = !DILocation(line: 552, column: 5, scope: !403)
!460 = !DILocation(line: 552, column: 9, scope: !403)
!461 = !DILocation(line: 553, column: 9, scope: !403)
!462 = !DILocation(line: 553, column: 45, scope: !403)
!463 = !DILocation(line: 553, column: 42, scope: !403)
!464 = !DILocation(line: 558, column: 13, scope: !403)
!465 = !DILocation(line: 559, column: 71, scope: !403)
!466 = !DILocation(line: 560, column: 9, scope: !403)
!467 = !DILocation(line: 561, column: 73, scope: !403)
!468 = !DILocation(line: 561, column: 71, scope: !403)
!469 = !DILocation(line: 564, column: 5, scope: !403)
!470 = !DILocation(line: 567, column: 69, scope: !403)
!471 = !DILocation(line: 567, column: 67, scope: !403)
!472 = !DILocation(line: 577, column: 40, scope: !403)
!473 = !DILocation(line: 577, column: 38, scope: !403)
!474 = !DILocation(line: 580, column: 12, scope: !403)
!475 = !DILocation(line: 580, column: 10, scope: !403)
!476 = !DILocation(line: 581, column: 1, scope: !403)
!477 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !1, file: !1, line: 583, type: !9, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!478 = !DILocation(line: 585, column: 10, scope: !477)
!479 = !DILocation(line: 589, column: 41, scope: !477)
!480 = !DILocation(line: 589, column: 39, scope: !477)
!481 = !DILocation(line: 591, column: 40, scope: !477)
!482 = !DILocation(line: 591, column: 38, scope: !477)
!483 = !DILocation(line: 593, column: 40, scope: !477)
!484 = !DILocation(line: 593, column: 38, scope: !477)
!485 = !DILocation(line: 595, column: 40, scope: !477)
!486 = !DILocation(line: 595, column: 38, scope: !477)
!487 = !DILocation(line: 597, column: 40, scope: !477)
!488 = !DILocation(line: 597, column: 38, scope: !477)
!489 = !DILocation(line: 601, column: 5, scope: !477)
!490 = !DILocation(line: 603, column: 41, scope: !477)
!491 = !DILocation(line: 603, column: 39, scope: !477)
!492 = !DILocation(line: 605, column: 40, scope: !477)
!493 = !DILocation(line: 605, column: 38, scope: !477)
!494 = !DILocation(line: 607, column: 15, scope: !477)
!495 = !DILocation(line: 609, column: 5, scope: !477)
!496 = !DILocation(line: 610, column: 5, scope: !477)
!497 = !DILocation(line: 611, column: 5, scope: !477)
!498 = !DILocation(line: 612, column: 62, scope: !477)
!499 = !DILocation(line: 612, column: 60, scope: !477)
!500 = !DILocation(line: 612, column: 13, scope: !477)
!501 = !DILocation(line: 614, column: 9, scope: !477)
!502 = !DILocation(line: 614, column: 17, scope: !477)
!503 = !DILocation(line: 614, column: 7, scope: !477)
!504 = !DILocation(line: 615, column: 9, scope: !477)
!505 = !DILocation(line: 615, column: 13, scope: !477)
!506 = !DILocation(line: 615, column: 11, scope: !477)
!507 = !DILocation(line: 615, column: 7, scope: !477)
!508 = !DILocation(line: 617, column: 5, scope: !477)
!509 = !DILocation(line: 617, column: 9, scope: !477)
!510 = !DILocation(line: 619, column: 9, scope: !477)
!511 = !DILocation(line: 619, column: 14, scope: !477)
!512 = !DILocation(line: 619, column: 11, scope: !477)
!513 = !DILocation(line: 620, column: 11, scope: !477)
!514 = !DILocation(line: 621, column: 5, scope: !477)
!515 = !DILocation(line: 622, column: 9, scope: !477)
!516 = !DILocation(line: 622, column: 13, scope: !477)
!517 = !DILocation(line: 623, column: 13, scope: !477)
!518 = !DILocation(line: 623, column: 18, scope: !477)
!519 = !DILocation(line: 623, column: 15, scope: !477)
!520 = !DILocation(line: 624, column: 15, scope: !477)
!521 = !DILocation(line: 625, column: 9, scope: !477)
!522 = !DILocation(line: 626, column: 5, scope: !477)
!523 = !DILocation(line: 635, column: 5, scope: !477)
!524 = !DILocation(line: 635, column: 9, scope: !477)
!525 = !DILocation(line: 636, column: 5, scope: !477)
!526 = !DILocation(line: 636, column: 80, scope: !477)
!527 = !DILocation(line: 636, column: 78, scope: !477)
!528 = !DILocation(line: 636, column: 9, scope: !477)
!529 = !DILocation(line: 637, column: 9, scope: !477)
!530 = !DILocation(line: 637, column: 16, scope: !477)
!531 = !DILocation(line: 637, column: 14, scope: !477)
!532 = !DILocation(line: 638, column: 32, scope: !477)
!533 = !DILocation(line: 639, column: 5, scope: !477)
!534 = !DILocation(line: 640, column: 32, scope: !477)
!535 = !DILocation(line: 645, column: 5, scope: !477)
!536 = !DILocation(line: 645, column: 9, scope: !477)
!537 = !DILocation(line: 646, column: 9, scope: !477)
!538 = !DILocation(line: 646, column: 45, scope: !477)
!539 = !DILocation(line: 646, column: 42, scope: !477)
!540 = !DILocation(line: 651, column: 13, scope: !477)
!541 = !DILocation(line: 652, column: 71, scope: !477)
!542 = !DILocation(line: 653, column: 9, scope: !477)
!543 = !DILocation(line: 654, column: 73, scope: !477)
!544 = !DILocation(line: 654, column: 71, scope: !477)
!545 = !DILocation(line: 658, column: 5, scope: !477)
!546 = !DILocation(line: 661, column: 69, scope: !477)
!547 = !DILocation(line: 661, column: 67, scope: !477)
!548 = !DILocation(line: 672, column: 40, scope: !477)
!549 = !DILocation(line: 672, column: 38, scope: !477)
!550 = !DILocation(line: 675, column: 12, scope: !477)
!551 = !DILocation(line: 675, column: 10, scope: !477)
!552 = !DILocation(line: 676, column: 1, scope: !477)
!553 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !1, file: !1, line: 684, type: !9, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!554 = !DILocation(line: 689, column: 10, scope: !553)
!555 = !DILocation(line: 700, column: 5, scope: !553)
