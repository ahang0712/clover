; ModuleID = 'wdt_pci_2.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_2.c"
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
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4
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
define void @closer_isr_1() #2 !dbg !32 {
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !33, !tbaa !34
  store i32 42, i32* @expect_close, align 4, !dbg !35, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !36, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !37, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !37
  br i1 %2, label %3, label %13, !dbg !37

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !38, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !38
  br i1 %5, label %12, label %6, !dbg !39

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !40, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !40
  %9 = icmp ne i32 %8, 86, !dbg !41
  br i1 %9, label %10, label %11, !dbg !40

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !42, !tbaa !17
  br label %11, !dbg !43

11:                                               ; preds = %10, %6
  br label %12, !dbg !44

12:                                               ; preds = %11, %3
  br label %13, !dbg !45

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !46, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !47
  br i1 %15, label %16, label %17, !dbg !46

16:                                               ; preds = %13
  br label %18, !dbg !48

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !49, !tbaa !17
  %19 = load i32, i32* @cnt1, align 4, !dbg !50, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !50
  store i32 %20, i32* @cnt1, align 4, !dbg !50, !tbaa !17
  ret void, !dbg !51
}

; Function Attrs: nounwind uwtable
define void @closer_isr_2() #2 !dbg !52 {
  store i8 87, i8* @wdtpci_write_buf, align 1, !dbg !53, !tbaa !34
  store i32 42, i32* @expect_close, align 4, !dbg !54, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !55, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !56, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !56
  br i1 %2, label %3, label %13, !dbg !56

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !57, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !57
  br i1 %5, label %12, label %6, !dbg !58

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !59, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !59
  %9 = icmp ne i32 %8, 86, !dbg !60
  br i1 %9, label %10, label %11, !dbg !59

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !61, !tbaa !17
  br label %11, !dbg !62

11:                                               ; preds = %10, %6
  br label %12, !dbg !63

12:                                               ; preds = %11, %3
  br label %13, !dbg !64

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !65, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !66
  br i1 %15, label %16, label %17, !dbg !65

16:                                               ; preds = %13
  br label %18, !dbg !67

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !68, !tbaa !17
  %19 = load i32, i32* @cnt2, align 4, !dbg !69, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !69
  store i32 %20, i32* @cnt2, align 4, !dbg !69, !tbaa !17
  ret void, !dbg !70
}

; Function Attrs: nounwind uwtable
define void @closer3() #2 !dbg !71 {
  call void @writer1(), !dbg !72
  store i8 86, i8* @wdtpci_write_buf, align 1, !dbg !73, !tbaa !34
  store i32 42, i32* @expect_close, align 4, !dbg !74, !tbaa !17
  store i32 1, i32* @count, align 4, !dbg !75, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !76, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !76
  br i1 %2, label %3, label %13, !dbg !76

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !77, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !77
  br i1 %5, label %12, label %6, !dbg !78

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !79, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !79
  %9 = icmp ne i32 %8, 86, !dbg !80
  br i1 %9, label %10, label %11, !dbg !79

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !81, !tbaa !17
  br label %11, !dbg !82

11:                                               ; preds = %10, %6
  br label %12, !dbg !83

12:                                               ; preds = %11, %3
  br label %13, !dbg !84

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @expect_close, align 4, !dbg !85, !tbaa !17
  %15 = icmp ne i32 %14, 42, !dbg !86
  br i1 %15, label %16, label %17, !dbg !85

16:                                               ; preds = %13
  br label %18, !dbg !87

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %16
  store i32 0, i32* @expect_close, align 4, !dbg !88, !tbaa !17
  %19 = load i32, i32* @cnt5, align 4, !dbg !89, !tbaa !17
  %20 = add nsw i32 %19, 1, !dbg !89
  store i32 %20, i32* @cnt5, align 4, !dbg !89, !tbaa !17
  ret void, !dbg !90
}

; Function Attrs: nounwind uwtable
define void @writer1() #2 !dbg !91 {
  store i32 0, i32* @count, align 4, !dbg !92, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !93, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !94, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !94
  br i1 %2, label %3, label %13, !dbg !94

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !95, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !95
  br i1 %5, label %12, label %6, !dbg !96

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !97, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !97
  %9 = icmp ne i32 %8, 86, !dbg !98
  br i1 %9, label %10, label %11, !dbg !97

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !99, !tbaa !17
  br label %11, !dbg !100

11:                                               ; preds = %10, %6
  br label %12, !dbg !101

12:                                               ; preds = %11, %3
  br label %13, !dbg !102

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt3, align 4, !dbg !103, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !103
  store i32 %15, i32* @cnt3, align 4, !dbg !103, !tbaa !17
  ret void, !dbg !104
}

; Function Attrs: nounwind uwtable
define void @writer2() #2 !dbg !105 {
  store i32 0, i32* @count, align 4, !dbg !106, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !107, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !108, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !108
  br i1 %2, label %3, label %13, !dbg !108

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !109, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !109
  br i1 %5, label %12, label %6, !dbg !110

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !111, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !111
  %9 = icmp ne i32 %8, 86, !dbg !112
  br i1 %9, label %10, label %11, !dbg !111

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !113, !tbaa !17
  br label %11, !dbg !114

11:                                               ; preds = %10, %6
  br label %12, !dbg !115

12:                                               ; preds = %11, %3
  br label %13, !dbg !116

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt4, align 4, !dbg !117, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !117
  store i32 %15, i32* @cnt4, align 4, !dbg !117, !tbaa !17
  ret void, !dbg !118
}

; Function Attrs: nounwind uwtable
define void @writer_isr_3() #2 !dbg !119 {
  store i32 0, i32* @count, align 4, !dbg !120, !tbaa !17
  store i32 0, i32* @expect_close, align 4, !dbg !121, !tbaa !17
  %1 = load i32, i32* @count, align 4, !dbg !122, !tbaa !17
  %2 = icmp ne i32 %1, 0, !dbg !122
  br i1 %2, label %3, label %13, !dbg !122

3:                                                ; preds = %0
  %4 = load i32, i32* @nowayout, align 4, !dbg !123, !tbaa !17
  %5 = icmp ne i32 %4, 0, !dbg !123
  br i1 %5, label %12, label %6, !dbg !124

6:                                                ; preds = %3
  %7 = load i8, i8* @wdtpci_write_buf, align 1, !dbg !125, !tbaa !34
  %8 = sext i8 %7 to i32, !dbg !125
  %9 = icmp ne i32 %8, 86, !dbg !126
  br i1 %9, label %10, label %11, !dbg !125

10:                                               ; preds = %6
  store i32 0, i32* @expect_close, align 4, !dbg !127, !tbaa !17
  br label %11, !dbg !128

11:                                               ; preds = %10, %6
  br label %12, !dbg !129

12:                                               ; preds = %11, %3
  br label %13, !dbg !130

13:                                               ; preds = %12, %0
  %14 = load i32, i32* @cnt6, align 4, !dbg !131, !tbaa !17
  %15 = add nsw i32 %14, 1, !dbg !131
  store i32 %15, i32* @cnt6, align 4, !dbg !131, !tbaa !17
  ret void, !dbg !132
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_022_001_main(i32 %0, i8** %1) #2 !dbg !133 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i32 %0, i32* %3, align 4, !tbaa !17
  store i8** %1, i8*** %4, align 8, !tbaa !134
  %7 = bitcast i64* %5 to i8*, !dbg !136
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #4, !dbg !136
  %8 = bitcast i64* %6 to i8*, !dbg !137
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #4, !dbg !137
  call void @closer3(), !dbg !138
  %9 = bitcast i64* %6 to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #4, !dbg !139
  %10 = bitcast i64* %5 to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #4, !dbg !139
  ret i32 0, !dbg !140
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

attributes #0 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt/wdt_pci_2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/wdt")
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
!32 = distinct !DISubprogram(name: "closer_isr_1", scope: !1, file: !1, line: 954, type: !9, scopeLine: 954, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 957, column: 26, scope: !32)
!34 = !{!12, !12, i64 0}
!35 = !DILocation(line: 958, column: 22, scope: !32)
!36 = !DILocation(line: 959, column: 15, scope: !32)
!37 = !DILocation(line: 961, column: 13, scope: !32)
!38 = !DILocation(line: 962, column: 18, scope: !32)
!39 = !DILocation(line: 962, column: 17, scope: !32)
!40 = !DILocation(line: 967, column: 21, scope: !32)
!41 = !DILocation(line: 967, column: 38, scope: !32)
!42 = !DILocation(line: 968, column: 34, scope: !32)
!43 = !DILocation(line: 969, column: 17, scope: !32)
!44 = !DILocation(line: 970, column: 13, scope: !32)
!45 = !DILocation(line: 971, column: 9, scope: !32)
!46 = !DILocation(line: 974, column: 13, scope: !32)
!47 = !DILocation(line: 974, column: 26, scope: !32)
!48 = !DILocation(line: 976, column: 9, scope: !32)
!49 = !DILocation(line: 979, column: 22, scope: !32)
!50 = !DILocation(line: 981, column: 13, scope: !32)
!51 = !DILocation(line: 984, column: 1, scope: !32)
!52 = distinct !DISubprogram(name: "closer_isr_2", scope: !1, file: !1, line: 986, type: !9, scopeLine: 986, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 989, column: 26, scope: !52)
!54 = !DILocation(line: 990, column: 22, scope: !52)
!55 = !DILocation(line: 991, column: 15, scope: !52)
!56 = !DILocation(line: 993, column: 13, scope: !52)
!57 = !DILocation(line: 994, column: 18, scope: !52)
!58 = !DILocation(line: 994, column: 17, scope: !52)
!59 = !DILocation(line: 999, column: 21, scope: !52)
!60 = !DILocation(line: 999, column: 38, scope: !52)
!61 = !DILocation(line: 1000, column: 34, scope: !52)
!62 = !DILocation(line: 1001, column: 17, scope: !52)
!63 = !DILocation(line: 1002, column: 13, scope: !52)
!64 = !DILocation(line: 1003, column: 9, scope: !52)
!65 = !DILocation(line: 1006, column: 13, scope: !52)
!66 = !DILocation(line: 1006, column: 26, scope: !52)
!67 = !DILocation(line: 1008, column: 9, scope: !52)
!68 = !DILocation(line: 1011, column: 22, scope: !52)
!69 = !DILocation(line: 1013, column: 13, scope: !52)
!70 = !DILocation(line: 1016, column: 1, scope: !52)
!71 = distinct !DISubprogram(name: "closer3", scope: !1, file: !1, line: 1019, type: !9, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 1021, column: 5, scope: !71)
!73 = !DILocation(line: 1024, column: 26, scope: !71)
!74 = !DILocation(line: 1025, column: 22, scope: !71)
!75 = !DILocation(line: 1026, column: 15, scope: !71)
!76 = !DILocation(line: 1028, column: 13, scope: !71)
!77 = !DILocation(line: 1029, column: 18, scope: !71)
!78 = !DILocation(line: 1029, column: 17, scope: !71)
!79 = !DILocation(line: 1034, column: 21, scope: !71)
!80 = !DILocation(line: 1034, column: 38, scope: !71)
!81 = !DILocation(line: 1035, column: 34, scope: !71)
!82 = !DILocation(line: 1036, column: 17, scope: !71)
!83 = !DILocation(line: 1037, column: 13, scope: !71)
!84 = !DILocation(line: 1038, column: 9, scope: !71)
!85 = !DILocation(line: 1041, column: 13, scope: !71)
!86 = !DILocation(line: 1041, column: 26, scope: !71)
!87 = !DILocation(line: 1043, column: 9, scope: !71)
!88 = !DILocation(line: 1046, column: 22, scope: !71)
!89 = !DILocation(line: 1048, column: 13, scope: !71)
!90 = !DILocation(line: 1051, column: 1, scope: !71)
!91 = distinct !DISubprogram(name: "writer1", scope: !1, file: !1, line: 1054, type: !9, scopeLine: 1054, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 1056, column: 15, scope: !91)
!93 = !DILocation(line: 1057, column: 22, scope: !91)
!94 = !DILocation(line: 1059, column: 13, scope: !91)
!95 = !DILocation(line: 1060, column: 18, scope: !91)
!96 = !DILocation(line: 1060, column: 17, scope: !91)
!97 = !DILocation(line: 1065, column: 21, scope: !91)
!98 = !DILocation(line: 1065, column: 38, scope: !91)
!99 = !DILocation(line: 1066, column: 34, scope: !91)
!100 = !DILocation(line: 1067, column: 17, scope: !91)
!101 = !DILocation(line: 1068, column: 13, scope: !91)
!102 = !DILocation(line: 1069, column: 9, scope: !91)
!103 = !DILocation(line: 1070, column: 13, scope: !91)
!104 = !DILocation(line: 1073, column: 1, scope: !91)
!105 = distinct !DISubprogram(name: "writer2", scope: !1, file: !1, line: 1075, type: !9, scopeLine: 1075, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 1077, column: 15, scope: !105)
!107 = !DILocation(line: 1078, column: 22, scope: !105)
!108 = !DILocation(line: 1080, column: 13, scope: !105)
!109 = !DILocation(line: 1081, column: 18, scope: !105)
!110 = !DILocation(line: 1081, column: 17, scope: !105)
!111 = !DILocation(line: 1086, column: 21, scope: !105)
!112 = !DILocation(line: 1086, column: 38, scope: !105)
!113 = !DILocation(line: 1087, column: 34, scope: !105)
!114 = !DILocation(line: 1088, column: 17, scope: !105)
!115 = !DILocation(line: 1089, column: 13, scope: !105)
!116 = !DILocation(line: 1090, column: 9, scope: !105)
!117 = !DILocation(line: 1091, column: 13, scope: !105)
!118 = !DILocation(line: 1094, column: 1, scope: !105)
!119 = distinct !DISubprogram(name: "writer_isr_3", scope: !1, file: !1, line: 1096, type: !9, scopeLine: 1096, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 1100, column: 15, scope: !119)
!121 = !DILocation(line: 1101, column: 22, scope: !119)
!122 = !DILocation(line: 1103, column: 13, scope: !119)
!123 = !DILocation(line: 1104, column: 18, scope: !119)
!124 = !DILocation(line: 1104, column: 17, scope: !119)
!125 = !DILocation(line: 1109, column: 21, scope: !119)
!126 = !DILocation(line: 1109, column: 38, scope: !119)
!127 = !DILocation(line: 1110, column: 34, scope: !119)
!128 = !DILocation(line: 1111, column: 17, scope: !119)
!129 = !DILocation(line: 1112, column: 13, scope: !119)
!130 = !DILocation(line: 1113, column: 9, scope: !119)
!131 = !DILocation(line: 1114, column: 13, scope: !119)
!132 = !DILocation(line: 1117, column: 1, scope: !119)
!133 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !1, file: !1, line: 1121, type: !9, scopeLine: 1121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!134 = !{!135, !135, i64 0}
!135 = !{!"any pointer", !12, i64 0}
!136 = !DILocation(line: 1123, column: 3, scope: !133)
!137 = !DILocation(line: 1124, column: 3, scope: !133)
!138 = !DILocation(line: 1126, column: 3, scope: !133)
!139 = !DILocation(line: 1169, column: 1, scope: !133)
!140 = !DILocation(line: 1127, column: 3, scope: !133)
