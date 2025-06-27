; ModuleID = 'wdt_pci_3-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@heartbeat = global i32 60, align 4
@nowayout = global i32 0, align 4
@wdtpci_write_buf = common global i8 0, align 1
@expect_close = common global i32 0, align 4
@count = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@cnt8 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4
@cnt7 = common global i32 0, align 4
@wdt_dc_port = common global i8 0, align 1
@jiffies = common global i64 0, align 8
@dev_count = common global i32 0, align 4
@open_sem = common global i32 0, align 4
@wdtpci_lock = common global i8 0, align 1
@io = common global i32 0, align 4
@irq = common global i32 0, align 4
@wd_heartbeat = common global i32 0, align 4
@buf = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @closer1() #0 !dbg !7 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !9, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !17, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !20, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !21, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !21
  br i1 %2, label %3, label %13, !dbg !21

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !22, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !22
  br i1 %5, label %12, label %6, !dbg !23

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !24, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !24
  %9 = icmp ne i32 %8, 86, !dbg !25
  br i1 %9, label %10, label %11, !dbg !24

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !26, !tbaa !18
  br label %11, !dbg !27

11:                                               ; preds = %10, %6
  br label %12, !dbg !28

12:                                               ; preds = %11, %3
  br label %13, !dbg !29

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !30, !tbaa !18
  %15 = icmp ne i32 %14, 42, !dbg !31
  br i1 %15, label %16, label %17, !dbg !30

16:                                               ; preds = %13
  br label %closer3.exit.i, !dbg !32

17:                                               ; preds = %13
  br label %closer3.exit.i

closer3.exit.i:                                   ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !33, !tbaa !18
  %18 = load i32, i32* @cnt5, align 4, !dbg !34, !tbaa !18
  %19 = add nsw i32 %18, 1, !dbg !34
  store i32 %19, i32* @cnt5, align 4, !dbg !34, !tbaa !18
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !35, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !36, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !37, !tbaa !18
  %20 = load i32, i32* @count, align 4, !dbg !38, !tbaa !18
  %21 = icmp ne i32 %20, 0, !dbg !38
  br i1 %21, label %22, label %32, !dbg !38

22:                                               ; preds = %closer3.exit.i
  %23 = load i32, i32* @nowayout, align 4, !dbg !39, !tbaa !18
  %24 = icmp ne i32 %23, 0, !dbg !39
  br i1 %24, label %31, label %25, !dbg !40

25:                                               ; preds = %22
  %26 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !41, !tbaa !14
  %27 = sext i8 %26 to i32, !dbg !41
  %28 = icmp ne i32 %27, 86, !dbg !42
  br i1 %28, label %29, label %30, !dbg !41

29:                                               ; preds = %25
  store i32 0, i32* @expect_close, align 4, !dbg !43, !tbaa !18
  br label %30, !dbg !44

30:                                               ; preds = %29, %25
  br label %31, !dbg !45

31:                                               ; preds = %30, %22
  br label %32, !dbg !46

32:                                               ; preds = %31, %closer3.exit.i
  %33 = load i32, i32* @expect_close, align 4, !dbg !47, !tbaa !18
  %34 = icmp ne i32 %33, 42, !dbg !48
  br i1 %34, label %35, label %36, !dbg !47

35:                                               ; preds = %32
  br label %closer2.exit, !dbg !49

36:                                               ; preds = %32
  br label %closer2.exit

closer2.exit:                                     ; preds = %35, %36
  store i32 0, i32* @expect_close, align 4, !dbg !50, !tbaa !18
  %37 = load i32, i32* @cnt2, align 4, !dbg !51, !tbaa !18
  %38 = add nsw i32 %37, 1, !dbg !51
  store i32 %38, i32* @cnt2, align 4, !dbg !51, !tbaa !18
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !52, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !53, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !54, !tbaa !18
  %39 = load i32, i32* @count, align 4, !dbg !55, !tbaa !18
  %40 = icmp ne i32 %39, 0, !dbg !55
  br i1 %40, label %41, label %51, !dbg !55

41:                                               ; preds = %closer2.exit
  %42 = load i32, i32* @nowayout, align 4, !dbg !56, !tbaa !18
  %43 = icmp ne i32 %42, 0, !dbg !56
  br i1 %43, label %50, label %44, !dbg !57

44:                                               ; preds = %41
  %45 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !58, !tbaa !14
  %46 = sext i8 %45 to i32, !dbg !58
  %47 = icmp ne i32 %46, 86, !dbg !59
  br i1 %47, label %48, label %49, !dbg !58

48:                                               ; preds = %44
  store i32 0, i32* @expect_close, align 4, !dbg !60, !tbaa !18
  br label %49, !dbg !61

49:                                               ; preds = %48, %44
  br label %50, !dbg !62

50:                                               ; preds = %49, %41
  br label %51, !dbg !63

51:                                               ; preds = %50, %closer2.exit
  %52 = load i32, i32* @expect_close, align 4, !dbg !64, !tbaa !18
  %53 = icmp ne i32 %52, 42, !dbg !65
  br i1 %53, label %54, label %55, !dbg !64

54:                                               ; preds = %51
  br label %56, !dbg !66

55:                                               ; preds = %51
  br label %56

56:                                               ; preds = %55, %54
  store i32 0, i32* @expect_close, align 4, !dbg !67, !tbaa !18
  %57 = load i32, i32* @cnt1, align 4, !dbg !68, !tbaa !18
  %58 = add nsw i32 %57, 1, !dbg !68
  store i32 %58, i32* @cnt1, align 4, !dbg !68, !tbaa !18
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define void @closer2() #0 !dbg !12 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !70, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !72, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !73, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !74, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !74
  br i1 %2, label %3, label %13, !dbg !74

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !75, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !75
  br i1 %5, label %12, label %6, !dbg !76

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !77, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !77
  %9 = icmp ne i32 %8, 86, !dbg !78
  br i1 %9, label %10, label %11, !dbg !77

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !79, !tbaa !18
  br label %11, !dbg !80

11:                                               ; preds = %10, %6
  br label %12, !dbg !81

12:                                               ; preds = %11, %3
  br label %13, !dbg !82

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !83, !tbaa !18
  %15 = icmp ne i32 %14, 42, !dbg !84
  br i1 %15, label %16, label %17, !dbg !83

16:                                               ; preds = %13
  br label %closer3.exit, !dbg !85

17:                                               ; preds = %13
  br label %closer3.exit

closer3.exit:                                     ; preds = %16, %17
  store i32 0, i32* @expect_close, align 4, !dbg !86, !tbaa !18
  %18 = load i32, i32* @cnt5, align 4, !dbg !87, !tbaa !18
  %19 = add nsw i32 %18, 1, !dbg !87
  store i32 %19, i32* @cnt5, align 4, !dbg !87, !tbaa !18
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !88, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !89, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !90, !tbaa !18
  %20 = load i32, i32* @count, align 4, !dbg !91, !tbaa !18
  %21 = icmp ne i32 %20, 0, !dbg !91
  br i1 %21, label %22, label %32, !dbg !91

22:                                               ; preds = %closer3.exit
  %23 = load i32, i32* @nowayout, align 4, !dbg !92, !tbaa !18
  %24 = icmp ne i32 %23, 0, !dbg !92
  br i1 %24, label %31, label %25, !dbg !93

25:                                               ; preds = %22
  %26 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !94, !tbaa !14
  %27 = sext i8 %26 to i32, !dbg !94
  %28 = icmp ne i32 %27, 86, !dbg !95
  br i1 %28, label %29, label %30, !dbg !94

29:                                               ; preds = %25
  store i32 0, i32* @expect_close, align 4, !dbg !96, !tbaa !18
  br label %30, !dbg !97

30:                                               ; preds = %29, %25
  br label %31, !dbg !98

31:                                               ; preds = %30, %22
  br label %32, !dbg !99

32:                                               ; preds = %31, %closer3.exit
  %33 = load i32, i32* @expect_close, align 4, !dbg !100, !tbaa !18
  %34 = icmp ne i32 %33, 42, !dbg !101
  br i1 %34, label %35, label %36, !dbg !100

35:                                               ; preds = %32
  br label %37, !dbg !102

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %36, %35
  store i32 0, i32* @expect_close, align 4, !dbg !103, !tbaa !18
  %38 = load i32, i32* @cnt2, align 4, !dbg !104, !tbaa !18
  %39 = add nsw i32 %38, 1, !dbg !104
  store i32 %39, i32* @cnt2, align 4, !dbg !104, !tbaa !18
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define void @closer3() #0 !dbg !10 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !106, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !107, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !108, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !109, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !109
  br i1 %2, label %3, label %13, !dbg !109

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !110, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !110
  br i1 %5, label %12, label %6, !dbg !111

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !112, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !112
  %9 = icmp ne i32 %8, 86, !dbg !113
  br i1 %9, label %10, label %11, !dbg !112

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !114, !tbaa !18
  br label %11, !dbg !115

11:                                               ; preds = %10, %6
  br label %12, !dbg !116

12:                                               ; preds = %11, %3
  br label %13, !dbg !117

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !118, !tbaa !18
  %15 = icmp ne i32 %14, 42, !dbg !119
  br i1 %15, label %16, label %17, !dbg !118

16:                                               ; preds = %13
  br label %18, !dbg !120

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !121, !tbaa !18
  %19 = load i32, i32* @cnt5, align 4, !dbg !122, !tbaa !18
  %20 = add nsw i32 %19, 1, !dbg !122
  store i32 %20, i32* @cnt5, align 4, !dbg !122, !tbaa !18
  ret void, !dbg !123
}

; Function Attrs: alwaysinline nounwind uwtable
define void @closer4() #1 !dbg !124 {
  %1 = call i32 (...) @closwer1(), !dbg !125
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !126, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !127, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !128, !tbaa !18
  %2 = load i32, i32* @count, align 4, !dbg !129, !tbaa !18
  %3 = icmp ne i32 %2, 0, !dbg !129
  br i1 %3, label %4, label %14, !dbg !129

4:                                                ; preds = %0
  %5 = load i32, i32* @nowayout, align 4, !dbg !130, !tbaa !18
  %6 = icmp ne i32 %5, 0, !dbg !130
  br i1 %6, label %13, label %7, !dbg !131

7:                                                ; preds = %4
  %8 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !132, !tbaa !14
  %9 = sext i8 %8 to i32, !dbg !132
  %10 = icmp ne i32 %9, 86, !dbg !133
  br i1 %10, label %11, label %12, !dbg !132

11:                                               ; preds = %7
  store i32 0, i32* @expect_close, align 4, !dbg !134, !tbaa !18
  br label %12, !dbg !135

12:                                               ; preds = %11, %7
  br label %13, !dbg !136

13:                                               ; preds = %12, %4
  br label %14, !dbg !137

14:                                               ; preds = %13, %0
  %15 = load i32, i32* @expect_close, align 4, !dbg !138, !tbaa !18
  %16 = icmp ne i32 %15, 42, !dbg !139
  br i1 %16, label %17, label %18, !dbg !138

17:                                               ; preds = %14
  br label %19, !dbg !140

18:                                               ; preds = %14
  br label %19

19:                                               ; preds = %18, %17
  store i32 0, i32* @expect_close, align 4, !dbg !141, !tbaa !18
  %20 = load i32, i32* @cnt8, align 4, !dbg !142, !tbaa !18
  %21 = add nsw i32 %20, 1, !dbg !142
  store i32 %21, i32* @cnt8, align 4, !dbg !142, !tbaa !18
  ret void, !dbg !143
}

declare i32 @closwer1(...) #2

; Function Attrs: nounwind uwtable
define void @writer1() #0 !dbg !144 {
  store i32 0, i32* @count, align 4, !dbg !145, !tbaa !18
  store i32 0, i32* @expect_close, align 4, !dbg !146, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !147, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !147
  br i1 %2, label %3, label %13, !dbg !147

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !148, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !148
  br i1 %5, label %12, label %6, !dbg !149

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !150, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !150
  %9 = icmp ne i32 %8, 86, !dbg !151
  br i1 %9, label %10, label %11, !dbg !150

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !152, !tbaa !18
  br label %11, !dbg !153

11:                                               ; preds = %10, %6
  br label %12, !dbg !154

12:                                               ; preds = %11, %3
  br label %13, !dbg !155

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !156, !tbaa !18
  %15 = add nsw i32 %14, 1, !dbg !156
  store i32 %15, i32* @cnt3, align 4, !dbg !156, !tbaa !18
  ret void, !dbg !157
}

; Function Attrs: nounwind uwtable
define void @writer_isr_2() #0 !dbg !158 {
  store i32 0, i32* @count, align 4, !dbg !159, !tbaa !18
  store i32 0, i32* @expect_close, align 4, !dbg !160, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !161, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !161
  br i1 %2, label %3, label %13, !dbg !161

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !162, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !162
  br i1 %5, label %12, label %6, !dbg !163

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !164, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !164
  %9 = icmp ne i32 %8, 86, !dbg !165
  br i1 %9, label %10, label %11, !dbg !164

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !166, !tbaa !18
  br label %11, !dbg !167

11:                                               ; preds = %10, %6
  br label %12, !dbg !168

12:                                               ; preds = %11, %3
  br label %13, !dbg !169

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !170, !tbaa !18
  %15 = add nsw i32 %14, 1, !dbg !170
  store i32 %15, i32* @cnt4, align 4, !dbg !170, !tbaa !18
  ret void, !dbg !171
}

; Function Attrs: nounwind uwtable
define void @writer_isr_3() #0 !dbg !172 {
  store i32 0, i32* @count, align 4, !dbg !173, !tbaa !18
  store i32 0, i32* @expect_close, align 4, !dbg !174, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !175, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !175
  br i1 %2, label %3, label %13, !dbg !175

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !176, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !176
  br i1 %5, label %12, label %6, !dbg !177

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !178, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !178
  %9 = icmp ne i32 %8, 86, !dbg !179
  br i1 %9, label %10, label %11, !dbg !178

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !180, !tbaa !18
  br label %11, !dbg !181

11:                                               ; preds = %10, %6
  br label %12, !dbg !182

12:                                               ; preds = %11, %3
  br label %13, !dbg !183

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt6, align 4, !dbg !184, !tbaa !18
  %15 = add nsw i32 %14, 1, !dbg !184
  store i32 %15, i32* @cnt6, align 4, !dbg !184, !tbaa !18
  ret void, !dbg !185
}

; Function Attrs: nounwind uwtable
define void @writer_isr_4() #0 !dbg !186 {
  store i32 0, i32* @count, align 4, !dbg !187, !tbaa !18
  store i32 0, i32* @expect_close, align 4, !dbg !188, !tbaa !18
  %1 = load i32, i32* @count, align 4, !dbg !189, !tbaa !18
  %2 = icmp ne i32 %1, 0, !dbg !189
  br i1 %2, label %3, label %13, !dbg !189

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !190, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !190
  br i1 %5, label %12, label %6, !dbg !191

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !192, !tbaa !14
  %8 = sext i8 %7 to i32, !dbg !192
  %9 = icmp ne i32 %8, 86, !dbg !193
  br i1 %9, label %10, label %11, !dbg !192

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !194, !tbaa !18
  br label %11, !dbg !195

11:                                               ; preds = %10, %6
  br label %12, !dbg !196

12:                                               ; preds = %11, %3
  br label %13, !dbg !197

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt7, align 4, !dbg !198, !tbaa !18
  %15 = add nsw i32 %14, 1, !dbg !198
  store i32 %15, i32* @cnt7, align 4, !dbg !198, !tbaa !18
  ret void, !dbg !199
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_023_001_main(i32 %0, i8** %1) #0 !dbg !200 {
  %3 = call i32 (...) @closwer1() #5, !dbg !201
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !203, !tbaa !14
  store i32 42, i32* @expect_close, align 4, !dbg !204, !tbaa !18
  store i32 1, i32* @count, align 4, !dbg !205, !tbaa !18
  %4 = load i32, i32* @count, align 4, !dbg !206, !tbaa !18
  %5 = icmp ne i32 %4, 0, !dbg !206
  br i1 %5, label %6, label %16, !dbg !206

6:                                                ; preds = %2
  %7 = load i32, i32* @nowayout, align 4, !dbg !207, !tbaa !18
  %8 = icmp ne i32 %7, 0, !dbg !207
  br i1 %8, label %15, label %9, !dbg !208

9:                                                ; preds = %6
  %10 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !209, !tbaa !14
  %11 = sext i8 %10 to i32, !dbg !209
  %12 = icmp ne i32 %11, 86, !dbg !210
  br i1 %12, label %13, label %14, !dbg !209

13:                                               ; preds = %9
  store i32 0, i32* @expect_close, align 4, !dbg !211, !tbaa !18
  br label %14, !dbg !212

14:                                               ; preds = %13, %9
  br label %15, !dbg !213

15:                                               ; preds = %14, %6
  br label %16, !dbg !214

16:                                               ; preds = %15, %2
  %17 = load i32, i32* @expect_close, align 4, !dbg !215, !tbaa !18
  %18 = icmp ne i32 %17, 42, !dbg !216
  br i1 %18, label %19, label %20, !dbg !215

19:                                               ; preds = %16
  br label %closer4.exit, !dbg !217

20:                                               ; preds = %16
  br label %closer4.exit

closer4.exit:                                     ; preds = %19, %20
  store i32 0, i32* @expect_close, align 4, !dbg !218, !tbaa !18
  %21 = load i32, i32* @cnt8, align 4, !dbg !219, !tbaa !18
  %22 = add nsw i32 %21, 1, !dbg !219
  store i32 %22, i32* @cnt8, align 4, !dbg !219, !tbaa !18
  call void @writer1(), !dbg !220
  call void @pthread_exit(i8* null) #6, !dbg !221
  unreachable, !dbg !221

23:                                               ; No predecessors!
  ret i32 undef, !dbg !222
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: noreturn
declare void @pthread_exit(i8*) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_3.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 955, type: !8, scopeLine: 955, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 1029, column: 26, scope: !10, inlinedAt: !11)
!10 = distinct !DISubprogram(name: "closer3", scope: !1, file: !1, line: 1025, type: !8, scopeLine: 1025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!11 = distinct !DILocation(line: 991, column: 5, scope: !12, inlinedAt: !13)
!12 = distinct !DISubprogram(name: "closer2", scope: !1, file: !1, line: 989, type: !8, scopeLine: 989, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = distinct !DILocation(line: 957, column: 5, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 1030, column: 22, scope: !10, inlinedAt: !11)
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !15, i64 0}
!20 = !DILocation(line: 1031, column: 15, scope: !10, inlinedAt: !11)
!21 = !DILocation(line: 1033, column: 13, scope: !10, inlinedAt: !11)
!22 = !DILocation(line: 1034, column: 18, scope: !10, inlinedAt: !11)
!23 = !DILocation(line: 1034, column: 17, scope: !10, inlinedAt: !11)
!24 = !DILocation(line: 1039, column: 21, scope: !10, inlinedAt: !11)
!25 = !DILocation(line: 1039, column: 38, scope: !10, inlinedAt: !11)
!26 = !DILocation(line: 1040, column: 34, scope: !10, inlinedAt: !11)
!27 = !DILocation(line: 1041, column: 17, scope: !10, inlinedAt: !11)
!28 = !DILocation(line: 1042, column: 13, scope: !10, inlinedAt: !11)
!29 = !DILocation(line: 1043, column: 9, scope: !10, inlinedAt: !11)
!30 = !DILocation(line: 1046, column: 13, scope: !10, inlinedAt: !11)
!31 = !DILocation(line: 1046, column: 26, scope: !10, inlinedAt: !11)
!32 = !DILocation(line: 1048, column: 9, scope: !10, inlinedAt: !11)
!33 = !DILocation(line: 1052, column: 22, scope: !10, inlinedAt: !11)
!34 = !DILocation(line: 1054, column: 13, scope: !10, inlinedAt: !11)
!35 = !DILocation(line: 994, column: 26, scope: !12, inlinedAt: !13)
!36 = !DILocation(line: 995, column: 22, scope: !12, inlinedAt: !13)
!37 = !DILocation(line: 996, column: 15, scope: !12, inlinedAt: !13)
!38 = !DILocation(line: 998, column: 13, scope: !12, inlinedAt: !13)
!39 = !DILocation(line: 999, column: 18, scope: !12, inlinedAt: !13)
!40 = !DILocation(line: 999, column: 17, scope: !12, inlinedAt: !13)
!41 = !DILocation(line: 1004, column: 21, scope: !12, inlinedAt: !13)
!42 = !DILocation(line: 1004, column: 38, scope: !12, inlinedAt: !13)
!43 = !DILocation(line: 1005, column: 34, scope: !12, inlinedAt: !13)
!44 = !DILocation(line: 1006, column: 17, scope: !12, inlinedAt: !13)
!45 = !DILocation(line: 1007, column: 13, scope: !12, inlinedAt: !13)
!46 = !DILocation(line: 1008, column: 9, scope: !12, inlinedAt: !13)
!47 = !DILocation(line: 1011, column: 13, scope: !12, inlinedAt: !13)
!48 = !DILocation(line: 1011, column: 26, scope: !12, inlinedAt: !13)
!49 = !DILocation(line: 1013, column: 9, scope: !12, inlinedAt: !13)
!50 = !DILocation(line: 1017, column: 22, scope: !12, inlinedAt: !13)
!51 = !DILocation(line: 1019, column: 13, scope: !12, inlinedAt: !13)
!52 = !DILocation(line: 959, column: 26, scope: !7)
!53 = !DILocation(line: 960, column: 22, scope: !7)
!54 = !DILocation(line: 961, column: 15, scope: !7)
!55 = !DILocation(line: 963, column: 13, scope: !7)
!56 = !DILocation(line: 964, column: 18, scope: !7)
!57 = !DILocation(line: 964, column: 17, scope: !7)
!58 = !DILocation(line: 969, column: 21, scope: !7)
!59 = !DILocation(line: 969, column: 38, scope: !7)
!60 = !DILocation(line: 970, column: 34, scope: !7)
!61 = !DILocation(line: 971, column: 17, scope: !7)
!62 = !DILocation(line: 972, column: 13, scope: !7)
!63 = !DILocation(line: 973, column: 9, scope: !7)
!64 = !DILocation(line: 976, column: 13, scope: !7)
!65 = !DILocation(line: 976, column: 26, scope: !7)
!66 = !DILocation(line: 978, column: 9, scope: !7)
!67 = !DILocation(line: 982, column: 22, scope: !7)
!68 = !DILocation(line: 984, column: 13, scope: !7)
!69 = !DILocation(line: 987, column: 1, scope: !7)
!70 = !DILocation(line: 1029, column: 26, scope: !10, inlinedAt: !71)
!71 = distinct !DILocation(line: 991, column: 5, scope: !12)
!72 = !DILocation(line: 1030, column: 22, scope: !10, inlinedAt: !71)
!73 = !DILocation(line: 1031, column: 15, scope: !10, inlinedAt: !71)
!74 = !DILocation(line: 1033, column: 13, scope: !10, inlinedAt: !71)
!75 = !DILocation(line: 1034, column: 18, scope: !10, inlinedAt: !71)
!76 = !DILocation(line: 1034, column: 17, scope: !10, inlinedAt: !71)
!77 = !DILocation(line: 1039, column: 21, scope: !10, inlinedAt: !71)
!78 = !DILocation(line: 1039, column: 38, scope: !10, inlinedAt: !71)
!79 = !DILocation(line: 1040, column: 34, scope: !10, inlinedAt: !71)
!80 = !DILocation(line: 1041, column: 17, scope: !10, inlinedAt: !71)
!81 = !DILocation(line: 1042, column: 13, scope: !10, inlinedAt: !71)
!82 = !DILocation(line: 1043, column: 9, scope: !10, inlinedAt: !71)
!83 = !DILocation(line: 1046, column: 13, scope: !10, inlinedAt: !71)
!84 = !DILocation(line: 1046, column: 26, scope: !10, inlinedAt: !71)
!85 = !DILocation(line: 1048, column: 9, scope: !10, inlinedAt: !71)
!86 = !DILocation(line: 1052, column: 22, scope: !10, inlinedAt: !71)
!87 = !DILocation(line: 1054, column: 13, scope: !10, inlinedAt: !71)
!88 = !DILocation(line: 994, column: 26, scope: !12)
!89 = !DILocation(line: 995, column: 22, scope: !12)
!90 = !DILocation(line: 996, column: 15, scope: !12)
!91 = !DILocation(line: 998, column: 13, scope: !12)
!92 = !DILocation(line: 999, column: 18, scope: !12)
!93 = !DILocation(line: 999, column: 17, scope: !12)
!94 = !DILocation(line: 1004, column: 21, scope: !12)
!95 = !DILocation(line: 1004, column: 38, scope: !12)
!96 = !DILocation(line: 1005, column: 34, scope: !12)
!97 = !DILocation(line: 1006, column: 17, scope: !12)
!98 = !DILocation(line: 1007, column: 13, scope: !12)
!99 = !DILocation(line: 1008, column: 9, scope: !12)
!100 = !DILocation(line: 1011, column: 13, scope: !12)
!101 = !DILocation(line: 1011, column: 26, scope: !12)
!102 = !DILocation(line: 1013, column: 9, scope: !12)
!103 = !DILocation(line: 1017, column: 22, scope: !12)
!104 = !DILocation(line: 1019, column: 13, scope: !12)
!105 = !DILocation(line: 1022, column: 1, scope: !12)
!106 = !DILocation(line: 1029, column: 26, scope: !10)
!107 = !DILocation(line: 1030, column: 22, scope: !10)
!108 = !DILocation(line: 1031, column: 15, scope: !10)
!109 = !DILocation(line: 1033, column: 13, scope: !10)
!110 = !DILocation(line: 1034, column: 18, scope: !10)
!111 = !DILocation(line: 1034, column: 17, scope: !10)
!112 = !DILocation(line: 1039, column: 21, scope: !10)
!113 = !DILocation(line: 1039, column: 38, scope: !10)
!114 = !DILocation(line: 1040, column: 34, scope: !10)
!115 = !DILocation(line: 1041, column: 17, scope: !10)
!116 = !DILocation(line: 1042, column: 13, scope: !10)
!117 = !DILocation(line: 1043, column: 9, scope: !10)
!118 = !DILocation(line: 1046, column: 13, scope: !10)
!119 = !DILocation(line: 1046, column: 26, scope: !10)
!120 = !DILocation(line: 1048, column: 9, scope: !10)
!121 = !DILocation(line: 1052, column: 22, scope: !10)
!122 = !DILocation(line: 1054, column: 13, scope: !10)
!123 = !DILocation(line: 1057, column: 1, scope: !10)
!124 = distinct !DISubprogram(name: "closer4", scope: !1, file: !1, line: 1059, type: !8, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 1061, column: 5, scope: !124)
!126 = !DILocation(line: 1064, column: 26, scope: !124)
!127 = !DILocation(line: 1065, column: 22, scope: !124)
!128 = !DILocation(line: 1066, column: 15, scope: !124)
!129 = !DILocation(line: 1068, column: 13, scope: !124)
!130 = !DILocation(line: 1069, column: 18, scope: !124)
!131 = !DILocation(line: 1069, column: 17, scope: !124)
!132 = !DILocation(line: 1074, column: 21, scope: !124)
!133 = !DILocation(line: 1074, column: 38, scope: !124)
!134 = !DILocation(line: 1075, column: 34, scope: !124)
!135 = !DILocation(line: 1076, column: 17, scope: !124)
!136 = !DILocation(line: 1077, column: 13, scope: !124)
!137 = !DILocation(line: 1078, column: 9, scope: !124)
!138 = !DILocation(line: 1081, column: 13, scope: !124)
!139 = !DILocation(line: 1081, column: 26, scope: !124)
!140 = !DILocation(line: 1083, column: 9, scope: !124)
!141 = !DILocation(line: 1086, column: 22, scope: !124)
!142 = !DILocation(line: 1088, column: 13, scope: !124)
!143 = !DILocation(line: 1091, column: 1, scope: !124)
!144 = distinct !DISubprogram(name: "writer1", scope: !1, file: !1, line: 1094, type: !8, scopeLine: 1094, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!145 = !DILocation(line: 1096, column: 15, scope: !144)
!146 = !DILocation(line: 1097, column: 22, scope: !144)
!147 = !DILocation(line: 1099, column: 13, scope: !144)
!148 = !DILocation(line: 1100, column: 18, scope: !144)
!149 = !DILocation(line: 1100, column: 17, scope: !144)
!150 = !DILocation(line: 1105, column: 21, scope: !144)
!151 = !DILocation(line: 1105, column: 38, scope: !144)
!152 = !DILocation(line: 1106, column: 34, scope: !144)
!153 = !DILocation(line: 1107, column: 17, scope: !144)
!154 = !DILocation(line: 1108, column: 13, scope: !144)
!155 = !DILocation(line: 1109, column: 9, scope: !144)
!156 = !DILocation(line: 1110, column: 13, scope: !144)
!157 = !DILocation(line: 1113, column: 1, scope: !144)
!158 = distinct !DISubprogram(name: "writer_isr_2", scope: !1, file: !1, line: 1115, type: !8, scopeLine: 1115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!159 = !DILocation(line: 1117, column: 15, scope: !158)
!160 = !DILocation(line: 1118, column: 22, scope: !158)
!161 = !DILocation(line: 1120, column: 13, scope: !158)
!162 = !DILocation(line: 1121, column: 18, scope: !158)
!163 = !DILocation(line: 1121, column: 17, scope: !158)
!164 = !DILocation(line: 1126, column: 21, scope: !158)
!165 = !DILocation(line: 1126, column: 38, scope: !158)
!166 = !DILocation(line: 1127, column: 34, scope: !158)
!167 = !DILocation(line: 1128, column: 17, scope: !158)
!168 = !DILocation(line: 1129, column: 13, scope: !158)
!169 = !DILocation(line: 1130, column: 9, scope: !158)
!170 = !DILocation(line: 1131, column: 13, scope: !158)
!171 = !DILocation(line: 1134, column: 1, scope: !158)
!172 = distinct !DISubprogram(name: "writer_isr_3", scope: !1, file: !1, line: 1136, type: !8, scopeLine: 1136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!173 = !DILocation(line: 1138, column: 15, scope: !172)
!174 = !DILocation(line: 1139, column: 22, scope: !172)
!175 = !DILocation(line: 1141, column: 13, scope: !172)
!176 = !DILocation(line: 1142, column: 18, scope: !172)
!177 = !DILocation(line: 1142, column: 17, scope: !172)
!178 = !DILocation(line: 1147, column: 21, scope: !172)
!179 = !DILocation(line: 1147, column: 38, scope: !172)
!180 = !DILocation(line: 1148, column: 34, scope: !172)
!181 = !DILocation(line: 1149, column: 17, scope: !172)
!182 = !DILocation(line: 1150, column: 13, scope: !172)
!183 = !DILocation(line: 1151, column: 9, scope: !172)
!184 = !DILocation(line: 1152, column: 13, scope: !172)
!185 = !DILocation(line: 1155, column: 1, scope: !172)
!186 = distinct !DISubprogram(name: "writer_isr_4", scope: !1, file: !1, line: 1157, type: !8, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!187 = !DILocation(line: 1159, column: 15, scope: !186)
!188 = !DILocation(line: 1160, column: 22, scope: !186)
!189 = !DILocation(line: 1162, column: 13, scope: !186)
!190 = !DILocation(line: 1163, column: 18, scope: !186)
!191 = !DILocation(line: 1163, column: 17, scope: !186)
!192 = !DILocation(line: 1168, column: 21, scope: !186)
!193 = !DILocation(line: 1168, column: 38, scope: !186)
!194 = !DILocation(line: 1169, column: 34, scope: !186)
!195 = !DILocation(line: 1170, column: 17, scope: !186)
!196 = !DILocation(line: 1171, column: 13, scope: !186)
!197 = !DILocation(line: 1172, column: 9, scope: !186)
!198 = !DILocation(line: 1173, column: 13, scope: !186)
!199 = !DILocation(line: 1176, column: 1, scope: !186)
!200 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !1, file: !1, line: 1181, type: !8, scopeLine: 1181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!201 = !DILocation(line: 1061, column: 5, scope: !124, inlinedAt: !202)
!202 = distinct !DILocation(line: 1187, column: 5, scope: !200)
!203 = !DILocation(line: 1064, column: 26, scope: !124, inlinedAt: !202)
!204 = !DILocation(line: 1065, column: 22, scope: !124, inlinedAt: !202)
!205 = !DILocation(line: 1066, column: 15, scope: !124, inlinedAt: !202)
!206 = !DILocation(line: 1068, column: 13, scope: !124, inlinedAt: !202)
!207 = !DILocation(line: 1069, column: 18, scope: !124, inlinedAt: !202)
!208 = !DILocation(line: 1069, column: 17, scope: !124, inlinedAt: !202)
!209 = !DILocation(line: 1074, column: 21, scope: !124, inlinedAt: !202)
!210 = !DILocation(line: 1074, column: 38, scope: !124, inlinedAt: !202)
!211 = !DILocation(line: 1075, column: 34, scope: !124, inlinedAt: !202)
!212 = !DILocation(line: 1076, column: 17, scope: !124, inlinedAt: !202)
!213 = !DILocation(line: 1077, column: 13, scope: !124, inlinedAt: !202)
!214 = !DILocation(line: 1078, column: 9, scope: !124, inlinedAt: !202)
!215 = !DILocation(line: 1081, column: 13, scope: !124, inlinedAt: !202)
!216 = !DILocation(line: 1081, column: 26, scope: !124, inlinedAt: !202)
!217 = !DILocation(line: 1083, column: 9, scope: !124, inlinedAt: !202)
!218 = !DILocation(line: 1086, column: 22, scope: !124, inlinedAt: !202)
!219 = !DILocation(line: 1088, column: 13, scope: !124, inlinedAt: !202)
!220 = !DILocation(line: 1188, column: 5, scope: !200)
!221 = !DILocation(line: 1231, column: 3, scope: !200)
!222 = !DILocation(line: 1232, column: 1, scope: !200)
