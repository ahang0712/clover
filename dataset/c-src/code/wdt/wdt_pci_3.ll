; ModuleID = 'wdt_pci_3.bc'
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
define void @closer1() #2 !dbg !32 {
  call void @closer2(), !dbg !33
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !34, !tbaa !35
  store i32 42, i32* @expect_close, align 4, !dbg !36, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !37, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !38, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !38
  br i1 %2, label %3, label %13, !dbg !38

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !39, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !39
  br i1 %5, label %12, label %6, !dbg !40

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !41, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !41
  %9 = icmp ne i32 %8, 86, !dbg !42
  br i1 %9, label %10, label %11, !dbg !41

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !43, !tbaa !17
  br label %11, !dbg !44

11:                                               ; preds = %10, %6
  br label %12, !dbg !45

12:                                               ; preds = %11, %3
  br label %13, !dbg !46

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !47, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !48
  br i1 %15, label %16, label %17, !dbg !47

16:                                               ; preds = %13
  br label %18, !dbg !49

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !50, !tbaa !17
  %19 = load i32, i32* @cnt1, align 4, !dbg !51, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !51
  store i32 %20, i32* @cnt1, align 4, !dbg !51, !tbaa !17
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @closer2() #2 !dbg !53 {
  call void @closer3(), !dbg !54
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !55, !tbaa !35
  store i32 42, i32* @expect_close, align 4, !dbg !56, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !57, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !58, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !58
  br i1 %2, label %3, label %13, !dbg !58

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !59, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !59
  br i1 %5, label %12, label %6, !dbg !60

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !61, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !61
  %9 = icmp ne i32 %8, 86, !dbg !62
  br i1 %9, label %10, label %11, !dbg !61

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !63, !tbaa !17
  br label %11, !dbg !64

11:                                               ; preds = %10, %6
  br label %12, !dbg !65

12:                                               ; preds = %11, %3
  br label %13, !dbg !66

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !67, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !68
  br i1 %15, label %16, label %17, !dbg !67

16:                                               ; preds = %13
  br label %18, !dbg !69

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !70, !tbaa !17
  %19 = load i32, i32* @cnt2, align 4, !dbg !71, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !71
  store i32 %20, i32* @cnt2, align 4, !dbg !71, !tbaa !17
  ret void, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @closer3() #2 !dbg !73 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !74, !tbaa !35
  store i32 42, i32* @expect_close, align 4, !dbg !75, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !76, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !77, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !77
  br i1 %2, label %3, label %13, !dbg !77

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !78, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !78
  br i1 %5, label %12, label %6, !dbg !79

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !80, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !80
  %9 = icmp ne i32 %8, 86, !dbg !81
  br i1 %9, label %10, label %11, !dbg !80

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !82, !tbaa !17
  br label %11, !dbg !83

11:                                               ; preds = %10, %6
  br label %12, !dbg !84

12:                                               ; preds = %11, %3
  br label %13, !dbg !85

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !86, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !87
  br i1 %15, label %16, label %17, !dbg !86

16:                                               ; preds = %13
  br label %18, !dbg !88

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !89, !tbaa !17
  %19 = load i32, i32* @cnt5, align 4, !dbg !90, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !90
  store i32 %20, i32* @cnt5, align 4, !dbg !90, !tbaa !17
  ret void, !dbg !91
}

; Function Attrs: alwaysinline nounwind uwtable
define void @closer4() #3 !dbg !92 {
  %1 = call i32 (...) @closwer1(), !dbg !93
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !94, !tbaa !35
  store i32 42, i32* @expect_close, align 4, !dbg !95, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !96, !tbaa !17
  %2 = load i32, i32* @count, align 4, !dbg !97, !tbaa !17
  %3 = icmp ne i32 %2, 0, !dbg !97
  br i1 %3, label %4, label %14, !dbg !97

4:                                                ; preds = %0
  %5 = load i32, i32* @nowayout, align 4, !dbg !98, !tbaa !17
  %6 = icmp ne i32 %5, 0, !dbg !98
  br i1 %6, label %13, label %7, !dbg !99

7:                                                ; preds = %4
  %8 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !100, !tbaa !35
  %9 = sext i8 %8 to i32, !dbg !100
  %10 = icmp ne i32 %9, 86, !dbg !101
  br i1 %10, label %11, label %12, !dbg !100

11:                                               ; preds = %7
  store i32 0, i32* @expect_close, align 4, !dbg !102, !tbaa !17
  br label %12, !dbg !103

12:                                               ; preds = %11, %7
  br label %13, !dbg !104

13:                                               ; preds = %12, %4
  br label %14, !dbg !105

14:                                               ; preds = %13, %0
  %15 = load i32, i32* @expect_close, align 4, !dbg !106, !tbaa !17
  %16 = icmp ne i32 %15, 42, !dbg !107
  br i1 %16, label %17, label %18, !dbg !106

17:                                               ; preds = %14
  br label %19, !dbg !108

18:                                               ; preds = %14
  br label %19

19:                                               ; preds = %18, %17
  store i32 0, i32* @expect_close, align 4, !dbg !109, !tbaa !17
  %20 = load i32, i32* @cnt8, align 4, !dbg !110, !tbaa !17
  %21 = add nsw i32 %20, 1, !dbg !110
  store i32 %21, i32* @cnt8, align 4, !dbg !110, !tbaa !17
  ret void, !dbg !111
}

declare i32 @closwer1(...) #4

; Function Attrs: nounwind uwtable
define void @writer1() #2 !dbg !112 {
  store i32 0, i32* @count, align 4, !dbg !113, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !114, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !115, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !115
  br i1 %2, label %3, label %13, !dbg !115

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !116, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !116
  br i1 %5, label %12, label %6, !dbg !117

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !118, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !118
  %9 = icmp ne i32 %8, 86, !dbg !119
  br i1 %9, label %10, label %11, !dbg !118

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !120, !tbaa !17
  br label %11, !dbg !121

11:                                               ; preds = %10, %6
  br label %12, !dbg !122

12:                                               ; preds = %11, %3
  br label %13, !dbg !123

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !124, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !124
  store i32 %15, i32* @cnt3, align 4, !dbg !124, !tbaa !17
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define void @writer_isr_2() #2 !dbg !126 {
  store i32 0, i32* @count, align 4, !dbg !127, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !128, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !129, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !129
  br i1 %2, label %3, label %13, !dbg !129

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !130, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !130
  br i1 %5, label %12, label %6, !dbg !131

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !132, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !132
  %9 = icmp ne i32 %8, 86, !dbg !133
  br i1 %9, label %10, label %11, !dbg !132

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !134, !tbaa !17
  br label %11, !dbg !135

11:                                               ; preds = %10, %6
  br label %12, !dbg !136

12:                                               ; preds = %11, %3
  br label %13, !dbg !137

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !138, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !138
  store i32 %15, i32* @cnt4, align 4, !dbg !138, !tbaa !17
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define void @writer_isr_3() #2 !dbg !140 {
  store i32 0, i32* @count, align 4, !dbg !141, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !142, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !143, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !143
  br i1 %2, label %3, label %13, !dbg !143

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !144, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !144
  br i1 %5, label %12, label %6, !dbg !145

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !146, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !146
  %9 = icmp ne i32 %8, 86, !dbg !147
  br i1 %9, label %10, label %11, !dbg !146

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !148, !tbaa !17
  br label %11, !dbg !149

11:                                               ; preds = %10, %6
  br label %12, !dbg !150

12:                                               ; preds = %11, %3
  br label %13, !dbg !151

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt6, align 4, !dbg !152, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !152
  store i32 %15, i32* @cnt6, align 4, !dbg !152, !tbaa !17
  ret void, !dbg !153
}

; Function Attrs: nounwind uwtable
define void @writer_isr_4() #2 !dbg !154 {
  store i32 0, i32* @count, align 4, !dbg !155, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !156, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !157, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !157
  br i1 %2, label %3, label %13, !dbg !157

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !158, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !158
  br i1 %5, label %12, label %6, !dbg !159

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !160, !tbaa !35
  %8 = sext i8 %7 to i32, !dbg !160
  %9 = icmp ne i32 %8, 86, !dbg !161
  br i1 %9, label %10, label %11, !dbg !160

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !162, !tbaa !17
  br label %11, !dbg !163

11:                                               ; preds = %10, %6
  br label %12, !dbg !164

12:                                               ; preds = %11, %3
  br label %13, !dbg !165

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt7, align 4, !dbg !166, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !166
  store i32 %15, i32* @cnt7, align 4, !dbg !166, !tbaa !17
  ret void, !dbg !167
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_023_001_main(i32 %0, i8** %1) #2 !dbg !168 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i32 %0, i32* %4, align 4, !tbaa !17
  store i8** %1, i8*** %5, align 8, !tbaa !169
  %8 = bitcast i64* %6 to i8*, !dbg !171
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #7, !dbg !171
  %9 = bitcast i64* %7 to i8*, !dbg !172
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #7, !dbg !172
  call void @closer4(), !dbg !173
  call void @writer1(), !dbg !174
  call void @pthread_exit(i8* null) #8, !dbg !175
  unreachable, !dbg !175

10:                                               ; No predecessors!
  %11 = load i32, i32* %3, align 4, !dbg !176
  ret i32 %11, !dbg !176
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: noreturn
declare void @pthread_exit(i8*) #6

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { alwaysinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn }

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
!7 = distinct !DISubprogram(name: "__uint16_identity", scope: !8, file: !8, line: 33, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt")
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
!27 = !DIFile(filename: "/usr/include/pthread.h", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt")
!28 = !DILocation(line: 1156, column: 10, scope: !26)
!29 = !DILocation(line: 1156, column: 23, scope: !26)
!30 = !DILocation(line: 1156, column: 20, scope: !26)
!31 = !DILocation(line: 1156, column: 3, scope: !26)
!32 = distinct !DISubprogram(name: "closer1", scope: !1, file: !1, line: 955, type: !9, scopeLine: 955, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 957, column: 5, scope: !32)
!34 = !DILocation(line: 959, column: 26, scope: !32)
!35 = !{!12, !12, i64 0}
!36 = !DILocation(line: 960, column: 22, scope: !32)
!37 = !DILocation(line: 961, column: 15, scope: !32)
!38 = !DILocation(line: 963, column: 13, scope: !32)
!39 = !DILocation(line: 964, column: 18, scope: !32)
!40 = !DILocation(line: 964, column: 17, scope: !32)
!41 = !DILocation(line: 969, column: 21, scope: !32)
!42 = !DILocation(line: 969, column: 38, scope: !32)
!43 = !DILocation(line: 970, column: 34, scope: !32)
!44 = !DILocation(line: 971, column: 17, scope: !32)
!45 = !DILocation(line: 972, column: 13, scope: !32)
!46 = !DILocation(line: 973, column: 9, scope: !32)
!47 = !DILocation(line: 976, column: 13, scope: !32)
!48 = !DILocation(line: 976, column: 26, scope: !32)
!49 = !DILocation(line: 978, column: 9, scope: !32)
!50 = !DILocation(line: 982, column: 22, scope: !32)
!51 = !DILocation(line: 984, column: 13, scope: !32)
!52 = !DILocation(line: 987, column: 1, scope: !32)
!53 = distinct !DISubprogram(name: "closer2", scope: !1, file: !1, line: 989, type: !9, scopeLine: 989, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 991, column: 5, scope: !53)
!55 = !DILocation(line: 994, column: 26, scope: !53)
!56 = !DILocation(line: 995, column: 22, scope: !53)
!57 = !DILocation(line: 996, column: 15, scope: !53)
!58 = !DILocation(line: 998, column: 13, scope: !53)
!59 = !DILocation(line: 999, column: 18, scope: !53)
!60 = !DILocation(line: 999, column: 17, scope: !53)
!61 = !DILocation(line: 1004, column: 21, scope: !53)
!62 = !DILocation(line: 1004, column: 38, scope: !53)
!63 = !DILocation(line: 1005, column: 34, scope: !53)
!64 = !DILocation(line: 1006, column: 17, scope: !53)
!65 = !DILocation(line: 1007, column: 13, scope: !53)
!66 = !DILocation(line: 1008, column: 9, scope: !53)
!67 = !DILocation(line: 1011, column: 13, scope: !53)
!68 = !DILocation(line: 1011, column: 26, scope: !53)
!69 = !DILocation(line: 1013, column: 9, scope: !53)
!70 = !DILocation(line: 1017, column: 22, scope: !53)
!71 = !DILocation(line: 1019, column: 13, scope: !53)
!72 = !DILocation(line: 1022, column: 1, scope: !53)
!73 = distinct !DISubprogram(name: "closer3", scope: !1, file: !1, line: 1025, type: !9, scopeLine: 1025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 1029, column: 26, scope: !73)
!75 = !DILocation(line: 1030, column: 22, scope: !73)
!76 = !DILocation(line: 1031, column: 15, scope: !73)
!77 = !DILocation(line: 1033, column: 13, scope: !73)
!78 = !DILocation(line: 1034, column: 18, scope: !73)
!79 = !DILocation(line: 1034, column: 17, scope: !73)
!80 = !DILocation(line: 1039, column: 21, scope: !73)
!81 = !DILocation(line: 1039, column: 38, scope: !73)
!82 = !DILocation(line: 1040, column: 34, scope: !73)
!83 = !DILocation(line: 1041, column: 17, scope: !73)
!84 = !DILocation(line: 1042, column: 13, scope: !73)
!85 = !DILocation(line: 1043, column: 9, scope: !73)
!86 = !DILocation(line: 1046, column: 13, scope: !73)
!87 = !DILocation(line: 1046, column: 26, scope: !73)
!88 = !DILocation(line: 1048, column: 9, scope: !73)
!89 = !DILocation(line: 1052, column: 22, scope: !73)
!90 = !DILocation(line: 1054, column: 13, scope: !73)
!91 = !DILocation(line: 1057, column: 1, scope: !73)
!92 = distinct !DISubprogram(name: "closer4", scope: !1, file: !1, line: 1059, type: !9, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 1061, column: 5, scope: !92)
!94 = !DILocation(line: 1064, column: 26, scope: !92)
!95 = !DILocation(line: 1065, column: 22, scope: !92)
!96 = !DILocation(line: 1066, column: 15, scope: !92)
!97 = !DILocation(line: 1068, column: 13, scope: !92)
!98 = !DILocation(line: 1069, column: 18, scope: !92)
!99 = !DILocation(line: 1069, column: 17, scope: !92)
!100 = !DILocation(line: 1074, column: 21, scope: !92)
!101 = !DILocation(line: 1074, column: 38, scope: !92)
!102 = !DILocation(line: 1075, column: 34, scope: !92)
!103 = !DILocation(line: 1076, column: 17, scope: !92)
!104 = !DILocation(line: 1077, column: 13, scope: !92)
!105 = !DILocation(line: 1078, column: 9, scope: !92)
!106 = !DILocation(line: 1081, column: 13, scope: !92)
!107 = !DILocation(line: 1081, column: 26, scope: !92)
!108 = !DILocation(line: 1083, column: 9, scope: !92)
!109 = !DILocation(line: 1086, column: 22, scope: !92)
!110 = !DILocation(line: 1088, column: 13, scope: !92)
!111 = !DILocation(line: 1091, column: 1, scope: !92)
!112 = distinct !DISubprogram(name: "writer1", scope: !1, file: !1, line: 1094, type: !9, scopeLine: 1094, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 1096, column: 15, scope: !112)
!114 = !DILocation(line: 1097, column: 22, scope: !112)
!115 = !DILocation(line: 1099, column: 13, scope: !112)
!116 = !DILocation(line: 1100, column: 18, scope: !112)
!117 = !DILocation(line: 1100, column: 17, scope: !112)
!118 = !DILocation(line: 1105, column: 21, scope: !112)
!119 = !DILocation(line: 1105, column: 38, scope: !112)
!120 = !DILocation(line: 1106, column: 34, scope: !112)
!121 = !DILocation(line: 1107, column: 17, scope: !112)
!122 = !DILocation(line: 1108, column: 13, scope: !112)
!123 = !DILocation(line: 1109, column: 9, scope: !112)
!124 = !DILocation(line: 1110, column: 13, scope: !112)
!125 = !DILocation(line: 1113, column: 1, scope: !112)
!126 = distinct !DISubprogram(name: "writer_isr_2", scope: !1, file: !1, line: 1115, type: !9, scopeLine: 1115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 1117, column: 15, scope: !126)
!128 = !DILocation(line: 1118, column: 22, scope: !126)
!129 = !DILocation(line: 1120, column: 13, scope: !126)
!130 = !DILocation(line: 1121, column: 18, scope: !126)
!131 = !DILocation(line: 1121, column: 17, scope: !126)
!132 = !DILocation(line: 1126, column: 21, scope: !126)
!133 = !DILocation(line: 1126, column: 38, scope: !126)
!134 = !DILocation(line: 1127, column: 34, scope: !126)
!135 = !DILocation(line: 1128, column: 17, scope: !126)
!136 = !DILocation(line: 1129, column: 13, scope: !126)
!137 = !DILocation(line: 1130, column: 9, scope: !126)
!138 = !DILocation(line: 1131, column: 13, scope: !126)
!139 = !DILocation(line: 1134, column: 1, scope: !126)
!140 = distinct !DISubprogram(name: "writer_isr_3", scope: !1, file: !1, line: 1136, type: !9, scopeLine: 1136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!141 = !DILocation(line: 1138, column: 15, scope: !140)
!142 = !DILocation(line: 1139, column: 22, scope: !140)
!143 = !DILocation(line: 1141, column: 13, scope: !140)
!144 = !DILocation(line: 1142, column: 18, scope: !140)
!145 = !DILocation(line: 1142, column: 17, scope: !140)
!146 = !DILocation(line: 1147, column: 21, scope: !140)
!147 = !DILocation(line: 1147, column: 38, scope: !140)
!148 = !DILocation(line: 1148, column: 34, scope: !140)
!149 = !DILocation(line: 1149, column: 17, scope: !140)
!150 = !DILocation(line: 1150, column: 13, scope: !140)
!151 = !DILocation(line: 1151, column: 9, scope: !140)
!152 = !DILocation(line: 1152, column: 13, scope: !140)
!153 = !DILocation(line: 1155, column: 1, scope: !140)
!154 = distinct !DISubprogram(name: "writer_isr_4", scope: !1, file: !1, line: 1157, type: !9, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!155 = !DILocation(line: 1159, column: 15, scope: !154)
!156 = !DILocation(line: 1160, column: 22, scope: !154)
!157 = !DILocation(line: 1162, column: 13, scope: !154)
!158 = !DILocation(line: 1163, column: 18, scope: !154)
!159 = !DILocation(line: 1163, column: 17, scope: !154)
!160 = !DILocation(line: 1168, column: 21, scope: !154)
!161 = !DILocation(line: 1168, column: 38, scope: !154)
!162 = !DILocation(line: 1169, column: 34, scope: !154)
!163 = !DILocation(line: 1170, column: 17, scope: !154)
!164 = !DILocation(line: 1171, column: 13, scope: !154)
!165 = !DILocation(line: 1172, column: 9, scope: !154)
!166 = !DILocation(line: 1173, column: 13, scope: !154)
!167 = !DILocation(line: 1176, column: 1, scope: !154)
!168 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !1, file: !1, line: 1181, type: !9, scopeLine: 1181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!169 = !{!170, !170, i64 0}
!170 = !{!"any pointer", !12, i64 0}
!171 = !DILocation(line: 1183, column: 3, scope: !168)
!172 = !DILocation(line: 1184, column: 3, scope: !168)
!173 = !DILocation(line: 1187, column: 5, scope: !168)
!174 = !DILocation(line: 1188, column: 5, scope: !168)
!175 = !DILocation(line: 1231, column: 3, scope: !168)
!176 = !DILocation(line: 1232, column: 1, scope: !168)
