; ModuleID = 'i2c_pca_isa_2.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@stdout = external global %struct._IO_FILE*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@irq = common global i32 0, align 4
@global_id = common global i32 0, align 4
@global_dev = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4
@global_clock = common global i32 0, align 4

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

; Function Attrs: nounwind uwtable
define void @req1() #3 !dbg !63 {
  store i32 1, i32* @irq, align 4, !dbg !64, !tbaa !40
  store i32 1, i32* @global_id, align 4, !dbg !65, !tbaa !40
  store i32 1, i32* @global_dev, align 4, !dbg !66, !tbaa !40
  %1 = load i32, i32* @global_dev, align 4, !dbg !67, !tbaa !40
  %2 = icmp ne i32 %1, 1, !dbg !68
  br i1 %2, label %3, label %4, !dbg !67

3:                                                ; preds = %0
  br label %4, !dbg !69

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !70, !tbaa !40
  %6 = icmp sgt i32 %5, -1, !dbg !71
  br i1 %6, label %7, label %12, !dbg !70

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !72, !tbaa !40
  %9 = icmp ne i32 %8, 1, !dbg !73
  br i1 %9, label %10, label %11, !dbg !72

10:                                               ; preds = %7
  br label %11, !dbg !74

11:                                               ; preds = %10, %7
  br label %12, !dbg !75

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !76, !tbaa !40
  store i32 -1, i32* @global_dev, align 4, !dbg !77, !tbaa !40
  %13 = load i32, i32* @cnt1, align 4, !dbg !78, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !78
  store i32 %14, i32* @cnt1, align 4, !dbg !78, !tbaa !40
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define void @req2() #3 !dbg !80 {
  store i32 2, i32* @irq, align 4, !dbg !81, !tbaa !40
  store i32 2, i32* @global_id, align 4, !dbg !82, !tbaa !40
  store i32 2, i32* @global_dev, align 4, !dbg !83, !tbaa !40
  %1 = load i32, i32* @global_dev, align 4, !dbg !84, !tbaa !40
  %2 = icmp ne i32 %1, 2, !dbg !85
  br i1 %2, label %3, label %4, !dbg !84

3:                                                ; preds = %0
  br label %4, !dbg !86

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !87, !tbaa !40
  %6 = icmp sgt i32 %5, -1, !dbg !88
  br i1 %6, label %7, label %12, !dbg !87

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !89, !tbaa !40
  %9 = icmp ne i32 %8, 2, !dbg !90
  br i1 %9, label %10, label %11, !dbg !89

10:                                               ; preds = %7
  br label %11, !dbg !91

11:                                               ; preds = %10, %7
  br label %12, !dbg !92

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt2, align 4, !dbg !93, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !93
  store i32 %14, i32* @cnt2, align 4, !dbg !93, !tbaa !40
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @req_isr_1() #3 !dbg !95 {
  store i32 3, i32* @irq, align 4, !dbg !96, !tbaa !40
  store i32 3, i32* @global_id, align 4, !dbg !97, !tbaa !40
  store i32 3, i32* @global_dev, align 4, !dbg !98, !tbaa !40
  %1 = load i32, i32* @global_dev, align 4, !dbg !99, !tbaa !40
  %2 = icmp ne i32 %1, 3, !dbg !100
  br i1 %2, label %3, label %4, !dbg !99

3:                                                ; preds = %0
  br label %4, !dbg !101

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !102, !tbaa !40
  %6 = icmp sgt i32 %5, -1, !dbg !103
  br i1 %6, label %7, label %12, !dbg !102

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !104, !tbaa !40
  %9 = icmp ne i32 %8, 3, !dbg !105
  br i1 %9, label %10, label %11, !dbg !104

10:                                               ; preds = %7
  br label %11, !dbg !106

11:                                               ; preds = %10, %7
  br label %12, !dbg !107

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt3, align 4, !dbg !108, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !108
  store i32 %14, i32* @cnt3, align 4, !dbg !108, !tbaa !40
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define void @req_isr_2() #3 !dbg !110 {
  store i32 0, i32* @irq, align 4, !dbg !111, !tbaa !40
  store i32 4, i32* @global_id, align 4, !dbg !112, !tbaa !40
  store i32 4, i32* @global_dev, align 4, !dbg !113, !tbaa !40
  %1 = load i32, i32* @global_dev, align 4, !dbg !114, !tbaa !40
  %2 = icmp ne i32 %1, 4, !dbg !115
  br i1 %2, label %3, label %4, !dbg !114

3:                                                ; preds = %0
  br label %4, !dbg !116

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !117, !tbaa !40
  %6 = icmp sgt i32 %5, -1, !dbg !118
  br i1 %6, label %7, label %12, !dbg !117

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !119, !tbaa !40
  %9 = icmp ne i32 %8, 4, !dbg !120
  br i1 %9, label %10, label %11, !dbg !119

10:                                               ; preds = %7
  br label %11, !dbg !121

11:                                               ; preds = %10, %7
  br label %12, !dbg !122

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt4, align 4, !dbg !123, !tbaa !40
  %14 = add nsw i32 %13, 1, !dbg !123
  store i32 %14, i32* @cnt4, align 4, !dbg !123, !tbaa !40
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define void @req_isr_3() #3 !dbg !125 {
  store i32 0, i32* @irq, align 4, !dbg !126, !tbaa !40
  store i32 5, i32* @global_id, align 4, !dbg !127, !tbaa !40
  store i32 5, i32* @global_dev, align 4, !dbg !127, !tbaa !40
  store i32 5, i32* @global_id, align 4, !dbg !128, !tbaa !40
  store i32 5, i32* @global_dev, align 4, !dbg !129, !tbaa !40
  %1 = load i32, i32* @cnt5, align 4, !dbg !130, !tbaa !40
  %2 = add nsw i32 %1, 1, !dbg !130
  store i32 %2, i32* @cnt5, align 4, !dbg !130, !tbaa !40
  ret void, !dbg !131
}

; Function Attrs: nounwind uwtable
define void @req6() #3 !dbg !132 {
  store i32 -1, i32* @irq, align 4, !dbg !133, !tbaa !40
  %1 = load i32, i32* @cnt6, align 4, !dbg !134, !tbaa !40
  %2 = add nsw i32 %1, 1, !dbg !134
  store i32 %2, i32* @cnt6, align 4, !dbg !134, !tbaa !40
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_008_001_main() #3 !dbg !136 {
  call void @req1(), !dbg !137
  call void @req6(), !dbg !138
  ret i32 0, !dbg !139
}

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone willreturn }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "vprintf", scope: !8, file: !8, line: 36, type: !9, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa")
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
!63 = distinct !DISubprogram(name: "req1", scope: !1, file: !1, line: 277, type: !9, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 281, column: 9, scope: !63)
!65 = !DILocation(line: 283, column: 15, scope: !63)
!66 = !DILocation(line: 284, column: 16, scope: !63)
!67 = !DILocation(line: 286, column: 9, scope: !63)
!68 = !DILocation(line: 286, column: 20, scope: !63)
!69 = !DILocation(line: 287, column: 5, scope: !63)
!70 = !DILocation(line: 288, column: 9, scope: !63)
!71 = !DILocation(line: 288, column: 13, scope: !63)
!72 = !DILocation(line: 289, column: 13, scope: !63)
!73 = !DILocation(line: 289, column: 23, scope: !63)
!74 = !DILocation(line: 290, column: 9, scope: !63)
!75 = !DILocation(line: 291, column: 5, scope: !63)
!76 = !DILocation(line: 293, column: 15, scope: !63)
!77 = !DILocation(line: 294, column: 16, scope: !63)
!78 = !DILocation(line: 295, column: 9, scope: !63)
!79 = !DILocation(line: 297, column: 1, scope: !63)
!80 = distinct !DISubprogram(name: "req2", scope: !1, file: !1, line: 299, type: !9, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 303, column: 9, scope: !80)
!82 = !DILocation(line: 305, column: 15, scope: !80)
!83 = !DILocation(line: 306, column: 16, scope: !80)
!84 = !DILocation(line: 308, column: 9, scope: !80)
!85 = !DILocation(line: 308, column: 20, scope: !80)
!86 = !DILocation(line: 309, column: 5, scope: !80)
!87 = !DILocation(line: 310, column: 9, scope: !80)
!88 = !DILocation(line: 310, column: 13, scope: !80)
!89 = !DILocation(line: 311, column: 13, scope: !80)
!90 = !DILocation(line: 311, column: 23, scope: !80)
!91 = !DILocation(line: 312, column: 9, scope: !80)
!92 = !DILocation(line: 313, column: 5, scope: !80)
!93 = !DILocation(line: 317, column: 9, scope: !80)
!94 = !DILocation(line: 319, column: 1, scope: !80)
!95 = distinct !DISubprogram(name: "req_isr_1", scope: !1, file: !1, line: 321, type: !9, scopeLine: 321, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 325, column: 9, scope: !95)
!97 = !DILocation(line: 327, column: 15, scope: !95)
!98 = !DILocation(line: 328, column: 16, scope: !95)
!99 = !DILocation(line: 330, column: 9, scope: !95)
!100 = !DILocation(line: 330, column: 20, scope: !95)
!101 = !DILocation(line: 331, column: 5, scope: !95)
!102 = !DILocation(line: 332, column: 9, scope: !95)
!103 = !DILocation(line: 332, column: 13, scope: !95)
!104 = !DILocation(line: 333, column: 13, scope: !95)
!105 = !DILocation(line: 333, column: 23, scope: !95)
!106 = !DILocation(line: 334, column: 9, scope: !95)
!107 = !DILocation(line: 335, column: 5, scope: !95)
!108 = !DILocation(line: 337, column: 9, scope: !95)
!109 = !DILocation(line: 339, column: 1, scope: !95)
!110 = distinct !DISubprogram(name: "req_isr_2", scope: !1, file: !1, line: 341, type: !9, scopeLine: 341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 345, column: 9, scope: !110)
!112 = !DILocation(line: 347, column: 15, scope: !110)
!113 = !DILocation(line: 348, column: 16, scope: !110)
!114 = !DILocation(line: 350, column: 9, scope: !110)
!115 = !DILocation(line: 350, column: 20, scope: !110)
!116 = !DILocation(line: 351, column: 5, scope: !110)
!117 = !DILocation(line: 352, column: 9, scope: !110)
!118 = !DILocation(line: 352, column: 13, scope: !110)
!119 = !DILocation(line: 353, column: 13, scope: !110)
!120 = !DILocation(line: 353, column: 23, scope: !110)
!121 = !DILocation(line: 354, column: 9, scope: !110)
!122 = !DILocation(line: 355, column: 5, scope: !110)
!123 = !DILocation(line: 357, column: 9, scope: !110)
!124 = !DILocation(line: 359, column: 1, scope: !110)
!125 = distinct !DISubprogram(name: "req_isr_3", scope: !1, file: !1, line: 361, type: !9, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!126 = !DILocation(line: 363, column: 9, scope: !125)
!127 = !DILocation(line: 364, column: 5, scope: !125)
!128 = !DILocation(line: 365, column: 15, scope: !125)
!129 = !DILocation(line: 366, column: 16, scope: !125)
!130 = !DILocation(line: 369, column: 9, scope: !125)
!131 = !DILocation(line: 371, column: 1, scope: !125)
!132 = distinct !DISubprogram(name: "req6", scope: !1, file: !1, line: 373, type: !9, scopeLine: 373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!133 = !DILocation(line: 375, column: 9, scope: !132)
!134 = !DILocation(line: 376, column: 9, scope: !132)
!135 = !DILocation(line: 378, column: 1, scope: !132)
!136 = distinct !DISubprogram(name: "svp_simple_008_001_main", scope: !1, file: !1, line: 380, type: !9, scopeLine: 380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!137 = !DILocation(line: 382, column: 5, scope: !136)
!138 = !DILocation(line: 384, column: 5, scope: !136)
!139 = !DILocation(line: 394, column: 5, scope: !136)
