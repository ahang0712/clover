; ModuleID = 'blink1-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink1.c"
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
define void @Timer_A_isr() #2 !dbg !7 {
  store i32 1, i32* @timerCount, align 4, !dbg !9, !tbaa !10
  %1 = load i32, i32* @timerCount, align 4, !dbg !14, !tbaa !10
  %2 = icmp ne i32 %1, 0, !dbg !15
  br i1 %2, label %3, label %4, !dbg !14

3:                                                ; preds = %0
  br label %4, !dbg !16

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !17, !tbaa !10
  %6 = icmp eq i32 %5, 0, !dbg !18
  br i1 %6, label %7, label %11, !dbg !17

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !19, !tbaa !10
  %9 = load i32, i32* @LED_1, align 4, !dbg !20, !tbaa !10
  %10 = add nsw i32 %8, %9, !dbg !21
  store i32 %10, i32* @P1OUT, align 4, !dbg !22, !tbaa !10
  br label %11, !dbg !23

11:                                               ; preds = %7, %4
  %12 = load i32, i32* @cnt1, align 4, !dbg !24, !tbaa !10
  %13 = add nsw i32 %12, 1, !dbg !24
  store i32 %13, i32* @cnt1, align 4, !dbg !24, !tbaa !10
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @Timer_B_isr() #2 !dbg !26 {
  store i32 1, i32* @timerCount, align 4, !dbg !27, !tbaa !10
  %1 = load i32, i32* @timerCount, align 4, !dbg !28, !tbaa !10
  %2 = icmp ne i32 %1, 0, !dbg !29
  br i1 %2, label %3, label %4, !dbg !28

3:                                                ; preds = %0
  br label %4, !dbg !30

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !31, !tbaa !10
  %6 = icmp eq i32 %5, 0, !dbg !32
  br i1 %6, label %7, label %9, !dbg !31

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !33, !tbaa !10
  store i32 %8, i32* @P1OUT, align 4, !dbg !34, !tbaa !10
  br label %9, !dbg !35

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !36, !tbaa !10
  %11 = add nsw i32 %10, 1, !dbg !36
  store i32 %11, i32* @cnt2, align 4, !dbg !36, !tbaa !10
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define void @Timer_Force_isr() #2 !dbg !38 {
  store i32 0, i32* @timerCount, align 4, !dbg !39, !tbaa !10
  %1 = load i32, i32* @timerCount, align 4, !dbg !40, !tbaa !10
  %2 = icmp ne i32 %1, 0, !dbg !41
  br i1 %2, label %3, label %4, !dbg !40

3:                                                ; preds = %0
  br label %4, !dbg !42

4:                                                ; preds = %3, %0
  store i32 1, i32* @timerCount, align 4, !dbg !43, !tbaa !10
  %5 = load i32, i32* @cnt3, align 4, !dbg !44, !tbaa !10
  %6 = add nsw i32 %5, 1, !dbg !44
  store i32 %6, i32* @cnt3, align 4, !dbg !44, !tbaa !10
  ret void, !dbg !45
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !46 {
  %1 = load i32, i32* @WDTPW, align 4, !dbg !47, !tbaa !10
  %2 = load i32, i32* @WDTHOLD, align 4, !dbg !48, !tbaa !10
  %3 = add nsw i32 %1, %2, !dbg !49
  store i32 %3, i32* @WDTCTL, align 4, !dbg !50, !tbaa !10
  %4 = load i32, i32* @LED_0, align 4, !dbg !51, !tbaa !10
  %5 = load i32, i32* @LED_1, align 4, !dbg !52, !tbaa !10
  %6 = add nsw i32 %4, %5, !dbg !53
  store i32 %6, i32* @LED_DIR, align 4, !dbg !54, !tbaa !10
  %7 = load i32, i32* @LED_0, align 4, !dbg !55, !tbaa !10
  %8 = load i32, i32* @LED_1, align 4, !dbg !56, !tbaa !10
  %9 = add nsw i32 %7, %8, !dbg !57
  %10 = add nsw i32 1, %9, !dbg !58
  store i32 %10, i32* @LED_OUT, align 4, !dbg !59, !tbaa !10
  %11 = load i32, i32* @CCIE, align 4, !dbg !60, !tbaa !10
  store i32 %11, i32* @CCTL0, align 4, !dbg !61, !tbaa !10
  %12 = load i32, i32* @TASSEL_2, align 4, !dbg !62, !tbaa !10
  %13 = load i32, i32* @MC_2, align 4, !dbg !63, !tbaa !10
  %14 = add nsw i32 %12, %13, !dbg !64
  store i32 %14, i32* @TACTL, align 4, !dbg !65, !tbaa !10
  store i32 0, i32* @timerCount, align 4, !dbg !66, !tbaa !10
  ret i32 0, !dbg !67
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "Timer_A_isr", scope: !1, file: !1, line: 30, type: !8, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 36, column: 20, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 41, column: 13, scope: !7)
!15 = !DILocation(line: 41, column: 24, scope: !7)
!16 = !DILocation(line: 43, column: 9, scope: !7)
!17 = !DILocation(line: 44, column: 12, scope: !7)
!18 = !DILocation(line: 44, column: 23, scope: !7)
!19 = !DILocation(line: 45, column: 22, scope: !7)
!20 = !DILocation(line: 45, column: 30, scope: !7)
!21 = !DILocation(line: 45, column: 28, scope: !7)
!22 = !DILocation(line: 45, column: 19, scope: !7)
!23 = !DILocation(line: 46, column: 9, scope: !7)
!24 = !DILocation(line: 47, column: 13, scope: !7)
!25 = !DILocation(line: 49, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "Timer_B_isr", scope: !1, file: !1, line: 52, type: !8, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 56, column: 20, scope: !26)
!28 = !DILocation(line: 60, column: 13, scope: !26)
!29 = !DILocation(line: 60, column: 24, scope: !26)
!30 = !DILocation(line: 62, column: 9, scope: !26)
!31 = !DILocation(line: 63, column: 13, scope: !26)
!32 = !DILocation(line: 63, column: 24, scope: !26)
!33 = !DILocation(line: 64, column: 22, scope: !26)
!34 = !DILocation(line: 64, column: 20, scope: !26)
!35 = !DILocation(line: 65, column: 9, scope: !26)
!36 = !DILocation(line: 66, column: 13, scope: !26)
!37 = !DILocation(line: 68, column: 1, scope: !26)
!38 = distinct !DISubprogram(name: "Timer_Force_isr", scope: !1, file: !1, line: 71, type: !8, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 76, column: 20, scope: !38)
!40 = !DILocation(line: 77, column: 13, scope: !38)
!41 = !DILocation(line: 77, column: 24, scope: !38)
!42 = !DILocation(line: 79, column: 9, scope: !38)
!43 = !DILocation(line: 80, column: 20, scope: !38)
!44 = !DILocation(line: 81, column: 13, scope: !38)
!45 = !DILocation(line: 83, column: 1, scope: !38)
!46 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 86, type: !8, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 88, column: 14, scope: !46)
!48 = !DILocation(line: 88, column: 22, scope: !46)
!49 = !DILocation(line: 88, column: 20, scope: !46)
!50 = !DILocation(line: 88, column: 12, scope: !46)
!51 = !DILocation(line: 90, column: 15, scope: !46)
!52 = !DILocation(line: 90, column: 23, scope: !46)
!53 = !DILocation(line: 90, column: 21, scope: !46)
!54 = !DILocation(line: 90, column: 13, scope: !46)
!55 = !DILocation(line: 92, column: 20, scope: !46)
!56 = !DILocation(line: 92, column: 26, scope: !46)
!57 = !DILocation(line: 92, column: 25, scope: !46)
!58 = !DILocation(line: 92, column: 17, scope: !46)
!59 = !DILocation(line: 92, column: 13, scope: !46)
!60 = !DILocation(line: 94, column: 13, scope: !46)
!61 = !DILocation(line: 94, column: 11, scope: !46)
!62 = !DILocation(line: 95, column: 13, scope: !46)
!63 = !DILocation(line: 95, column: 24, scope: !46)
!64 = !DILocation(line: 95, column: 22, scope: !46)
!65 = !DILocation(line: 95, column: 11, scope: !46)
!66 = !DILocation(line: 97, column: 16, scope: !46)
!67 = !DILocation(line: 111, column: 1, scope: !46)
