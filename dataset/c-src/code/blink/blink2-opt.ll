; ModuleID = 'blink2-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@stdout = external global %struct._IO_FILE*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@timerCount = global i32 0, align 4
@LED_0 = common global i32 0, align 4
@LED_1 = common global i32 0, align 4
@P1OUT = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@WDTPW = common global i32 0, align 4
@WDTHOLD = common global i32 0, align 4
@WDTCTL = common global i32 0, align 4
@LED_DIR = common global i32 0, align 4
@LED_OUT = common global i32 0, align 4
@CCIE = common global i32 0, align 4
@CCTL0 = common global i32 0, align 4
@TASSEL_2 = common global i32 0, align 4
@MC_2 = common global i32 0, align 4
@TACTL = common global i32 0, align 4
@WDTCLT = common global i32 0, align 4

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #0

declare i32 @_IO_getc(%struct._IO_FILE*) #0

; Function Attrs: nounwind readnone willreturn
declare i64 @llvm.expect.i64(i64, i64) #1

declare i32 @__uflow(%struct._IO_FILE*) #0

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #0

declare i32 @__overflow(%struct._IO_FILE*, i32) #0

; Function Attrs: nounwind uwtable
define void @Timer_isr_1() #2 !dbg !7 {
  %1 = load i32, i32* @timerCount, align 4, !dbg !9, !tbaa !10
  %2 = add i32 %1, 1, !dbg !14
  store i32 %2, i32* @timerCount, align 4, !dbg !15, !tbaa !10
  %3 = load i32, i32* @timerCount, align 4, !dbg !16, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !17
  br i1 %4, label %5, label %6, !dbg !16

5:                                                ; preds = %0
  br label %6, !dbg !18

6:                                                ; preds = %5, %0
  %7 = load i32, i32* @timerCount, align 4, !dbg !19, !tbaa !10
  %8 = icmp eq i32 %7, 0, !dbg !20
  br i1 %8, label %9, label %13, !dbg !19

9:                                                ; preds = %6
  %10 = load i32, i32* @LED_0, align 4, !dbg !21, !tbaa !10
  %11 = load i32, i32* @LED_1, align 4, !dbg !22, !tbaa !10
  %12 = add nsw i32 %10, %11, !dbg !23
  store i32 %12, i32* @P1OUT, align 4, !dbg !24, !tbaa !10
  br label %13, !dbg !25

13:                                               ; preds = %9, %6
  %14 = load i32, i32* @cnt1, align 4, !dbg !26, !tbaa !10
  %15 = add nsw i32 %14, 1, !dbg !26
  store i32 %15, i32* @cnt1, align 4, !dbg !26, !tbaa !10
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @Timer_B() #2 !dbg !28 {
  store i32 0, i32* @timerCount, align 4, !dbg !29, !tbaa !10
  %1 = load i32, i32* @timerCount, align 4, !dbg !30, !tbaa !10
  %2 = icmp ne i32 %1, 0, !dbg !31
  br i1 %2, label %3, label %4, !dbg !30

3:                                                ; preds = %0
  br label %4, !dbg !32

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !33, !tbaa !10
  %6 = icmp eq i32 %5, 0, !dbg !34
  br i1 %6, label %7, label %9, !dbg !33

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !35, !tbaa !10
  store i32 %8, i32* @P1OUT, align 4, !dbg !36, !tbaa !10
  br label %9, !dbg !37

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !38, !tbaa !10
  %11 = add nsw i32 %10, 1, !dbg !38
  store i32 %11, i32* @cnt2, align 4, !dbg !38, !tbaa !10
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @Timer_isr_3() #2 !dbg !40 {
  store i32 0, i32* @timerCount, align 4, !dbg !41, !tbaa !10
  %1 = load i32, i32* @timerCount, align 4, !dbg !42, !tbaa !10
  %2 = icmp ne i32 %1, 0, !dbg !43
  br i1 %2, label %3, label %4, !dbg !42

3:                                                ; preds = %0
  br label %4, !dbg !44

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !45, !tbaa !10
  %6 = icmp eq i32 %5, 0, !dbg !46
  br i1 %6, label %7, label %9, !dbg !45

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !47, !tbaa !10
  store i32 %8, i32* @P1OUT, align 4, !dbg !48, !tbaa !10
  br label %9, !dbg !49

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt3, align 4, !dbg !50, !tbaa !10
  %11 = add nsw i32 %10, 1, !dbg !50
  store i32 %11, i32* @cnt3, align 4, !dbg !50, !tbaa !10
  ret void, !dbg !51
}

; Function Attrs: nounwind uwtable
define void @Timer_isr_2() #2 !dbg !52 {
  store i32 1, i32* @timerCount, align 4, !dbg !53, !tbaa !10
  %1 = load i32, i32* @cnt4, align 4, !dbg !54, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !54
  store i32 %2, i32* @cnt4, align 4, !dbg !54, !tbaa !10
  ret void, !dbg !55
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_002_001_main() #2 !dbg !56 {
  %1 = load i32, i32* @WDTPW, align 4, !dbg !57, !tbaa !10
  %2 = load i32, i32* @WDTHOLD, align 4, !dbg !58, !tbaa !10
  %3 = add nsw i32 %1, %2, !dbg !59
  store i32 %3, i32* @WDTCTL, align 4, !dbg !60, !tbaa !10
  %4 = load i32, i32* @LED_0, align 4, !dbg !61, !tbaa !10
  %5 = load i32, i32* @LED_1, align 4, !dbg !62, !tbaa !10
  %6 = add nsw i32 %4, %5, !dbg !63
  store i32 %6, i32* @LED_DIR, align 4, !dbg !64, !tbaa !10
  %7 = load i32, i32* @LED_0, align 4, !dbg !65, !tbaa !10
  %8 = load i32, i32* @LED_1, align 4, !dbg !66, !tbaa !10
  %9 = add nsw i32 %7, %8, !dbg !67
  %10 = add nsw i32 1, %9, !dbg !68
  store i32 %10, i32* @LED_OUT, align 4, !dbg !69, !tbaa !10
  %11 = load i32, i32* @CCIE, align 4, !dbg !70, !tbaa !10
  store i32 %11, i32* @CCTL0, align 4, !dbg !71, !tbaa !10
  %12 = load i32, i32* @TASSEL_2, align 4, !dbg !72, !tbaa !10
  %13 = load i32, i32* @MC_2, align 4, !dbg !73, !tbaa !10
  %14 = add nsw i32 %12, %13, !dbg !74
  store i32 %14, i32* @TACTL, align 4, !dbg !75, !tbaa !10
  store i32 0, i32* @timerCount, align 4, !dbg !76, !tbaa !10
  store i32 0, i32* @timerCount, align 4, !dbg !77, !tbaa !10
  %15 = load i32, i32* @timerCount, align 4, !dbg !79, !tbaa !10
  %16 = icmp ne i32 %15, 0, !dbg !80
  br i1 %16, label %17, label %18, !dbg !79

17:                                               ; preds = %0
  br label %18, !dbg !81

18:                                               ; preds = %17, %0
  %19 = load i32, i32* @timerCount, align 4, !dbg !82, !tbaa !10
  %20 = icmp eq i32 %19, 0, !dbg !83
  br i1 %20, label %21, label %Timer_B.exit, !dbg !82

21:                                               ; preds = %18
  %22 = load i32, i32* @LED_0, align 4, !dbg !84, !tbaa !10
  store i32 %22, i32* @P1OUT, align 4, !dbg !85, !tbaa !10
  br label %Timer_B.exit, !dbg !86

Timer_B.exit:                                     ; preds = %18, %21
  %23 = load i32, i32* @cnt2, align 4, !dbg !87, !tbaa !10
  %24 = add nsw i32 %23, 1, !dbg !87
  store i32 %24, i32* @cnt2, align 4, !dbg !87, !tbaa !10
  ret i32 undef, !dbg !88
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "Timer_isr_1", scope: !1, file: !1, line: 29, type: !8, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 35, column: 23, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 35, column: 34, scope: !7)
!15 = !DILocation(line: 35, column: 20, scope: !7)
!16 = !DILocation(line: 39, column: 13, scope: !7)
!17 = !DILocation(line: 39, column: 24, scope: !7)
!18 = !DILocation(line: 41, column: 9, scope: !7)
!19 = !DILocation(line: 42, column: 12, scope: !7)
!20 = !DILocation(line: 42, column: 23, scope: !7)
!21 = !DILocation(line: 43, column: 22, scope: !7)
!22 = !DILocation(line: 43, column: 30, scope: !7)
!23 = !DILocation(line: 43, column: 28, scope: !7)
!24 = !DILocation(line: 43, column: 19, scope: !7)
!25 = !DILocation(line: 44, column: 9, scope: !7)
!26 = !DILocation(line: 45, column: 13, scope: !7)
!27 = !DILocation(line: 47, column: 1, scope: !7)
!28 = distinct !DISubprogram(name: "Timer_B", scope: !1, file: !1, line: 50, type: !8, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 55, column: 20, scope: !28)
!30 = !DILocation(line: 59, column: 13, scope: !28)
!31 = !DILocation(line: 59, column: 24, scope: !28)
!32 = !DILocation(line: 61, column: 9, scope: !28)
!33 = !DILocation(line: 62, column: 13, scope: !28)
!34 = !DILocation(line: 62, column: 24, scope: !28)
!35 = !DILocation(line: 63, column: 22, scope: !28)
!36 = !DILocation(line: 63, column: 20, scope: !28)
!37 = !DILocation(line: 64, column: 9, scope: !28)
!38 = !DILocation(line: 65, column: 13, scope: !28)
!39 = !DILocation(line: 67, column: 1, scope: !28)
!40 = distinct !DISubprogram(name: "Timer_isr_3", scope: !1, file: !1, line: 70, type: !8, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 73, column: 20, scope: !40)
!42 = !DILocation(line: 77, column: 13, scope: !40)
!43 = !DILocation(line: 77, column: 24, scope: !40)
!44 = !DILocation(line: 79, column: 9, scope: !40)
!45 = !DILocation(line: 80, column: 13, scope: !40)
!46 = !DILocation(line: 80, column: 24, scope: !40)
!47 = !DILocation(line: 81, column: 22, scope: !40)
!48 = !DILocation(line: 81, column: 20, scope: !40)
!49 = !DILocation(line: 82, column: 9, scope: !40)
!50 = !DILocation(line: 83, column: 13, scope: !40)
!51 = !DILocation(line: 85, column: 1, scope: !40)
!52 = distinct !DISubprogram(name: "Timer_isr_2", scope: !1, file: !1, line: 88, type: !8, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 94, column: 20, scope: !52)
!54 = !DILocation(line: 95, column: 13, scope: !52)
!55 = !DILocation(line: 97, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !1, file: !1, line: 99, type: !8, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 101, column: 14, scope: !56)
!58 = !DILocation(line: 101, column: 22, scope: !56)
!59 = !DILocation(line: 101, column: 20, scope: !56)
!60 = !DILocation(line: 101, column: 12, scope: !56)
!61 = !DILocation(line: 103, column: 15, scope: !56)
!62 = !DILocation(line: 103, column: 23, scope: !56)
!63 = !DILocation(line: 103, column: 21, scope: !56)
!64 = !DILocation(line: 103, column: 13, scope: !56)
!65 = !DILocation(line: 105, column: 20, scope: !56)
!66 = !DILocation(line: 105, column: 26, scope: !56)
!67 = !DILocation(line: 105, column: 25, scope: !56)
!68 = !DILocation(line: 105, column: 17, scope: !56)
!69 = !DILocation(line: 105, column: 13, scope: !56)
!70 = !DILocation(line: 107, column: 13, scope: !56)
!71 = !DILocation(line: 107, column: 11, scope: !56)
!72 = !DILocation(line: 108, column: 13, scope: !56)
!73 = !DILocation(line: 108, column: 24, scope: !56)
!74 = !DILocation(line: 108, column: 22, scope: !56)
!75 = !DILocation(line: 108, column: 11, scope: !56)
!76 = !DILocation(line: 110, column: 16, scope: !56)
!77 = !DILocation(line: 55, column: 20, scope: !28, inlinedAt: !78)
!78 = distinct !DILocation(line: 113, column: 5, scope: !56)
!79 = !DILocation(line: 59, column: 13, scope: !28, inlinedAt: !78)
!80 = !DILocation(line: 59, column: 24, scope: !28, inlinedAt: !78)
!81 = !DILocation(line: 61, column: 9, scope: !28, inlinedAt: !78)
!82 = !DILocation(line: 62, column: 13, scope: !28, inlinedAt: !78)
!83 = !DILocation(line: 62, column: 24, scope: !28, inlinedAt: !78)
!84 = !DILocation(line: 63, column: 22, scope: !28, inlinedAt: !78)
!85 = !DILocation(line: 63, column: 20, scope: !28, inlinedAt: !78)
!86 = !DILocation(line: 64, column: 9, scope: !28, inlinedAt: !78)
!87 = !DILocation(line: 65, column: 13, scope: !28, inlinedAt: !78)
!88 = !DILocation(line: 123, column: 1, scope: !56)
