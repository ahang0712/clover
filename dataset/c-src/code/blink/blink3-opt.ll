; ModuleID = 'blink3-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink3.c"
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
@cnt5 = common global i32 0, align 4
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
  %1 = load i32, i32* @timerCount, align 4, !dbg !9, !tbaa !12
  %2 = add i32 %1, 1, !dbg !9
  store i32 %2, i32* @timerCount, align 4, !dbg !9, !tbaa !12
  %3 = load i32, i32* @cnt4, align 4, !dbg !16, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !16
  store i32 %4, i32* @cnt4, align 4, !dbg !16, !tbaa !12
  store i32 1, i32* @timerCount, align 4, !dbg !17, !tbaa !12
  %5 = load i32, i32* @timerCount, align 4, !dbg !18, !tbaa !12
  %6 = icmp ne i32 %5, 0, !dbg !19
  br i1 %6, label %7, label %8, !dbg !18

7:                                                ; preds = %0
  br label %8, !dbg !20

8:                                                ; preds = %7, %0
  %9 = load i32, i32* @timerCount, align 4, !dbg !21, !tbaa !12
  %10 = icmp eq i32 %9, 0, !dbg !22
  br i1 %10, label %11, label %15, !dbg !21

11:                                               ; preds = %8
  %12 = load i32, i32* @LED_0, align 4, !dbg !23, !tbaa !12
  %13 = load i32, i32* @LED_1, align 4, !dbg !24, !tbaa !12
  %14 = add nsw i32 %12, %13, !dbg !25
  store i32 %14, i32* @P1OUT, align 4, !dbg !26, !tbaa !12
  br label %15, !dbg !27

15:                                               ; preds = %11, %8
  %16 = load i32, i32* @cnt1, align 4, !dbg !28, !tbaa !12
  %17 = add nsw i32 %16, 1, !dbg !28
  store i32 %17, i32* @cnt1, align 4, !dbg !28, !tbaa !12
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define void @Timer_B_isr() #2 !dbg !30 {
  store i32 1, i32* @timerCount, align 4, !dbg !31, !tbaa !12
  %1 = load i32, i32* @timerCount, align 4, !dbg !32, !tbaa !12
  %2 = icmp ne i32 %1, 0, !dbg !33
  br i1 %2, label %3, label %4, !dbg !32

3:                                                ; preds = %0
  br label %4, !dbg !34

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !35, !tbaa !12
  %6 = icmp eq i32 %5, 0, !dbg !36
  br i1 %6, label %7, label %9, !dbg !35

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !37, !tbaa !12
  store i32 %8, i32* @P1OUT, align 4, !dbg !38, !tbaa !12
  br label %9, !dbg !39

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt2, align 4, !dbg !40, !tbaa !12
  %11 = add nsw i32 %10, 1, !dbg !40
  store i32 %11, i32* @cnt2, align 4, !dbg !40, !tbaa !12
  store i32 0, i32* @timerCount, align 4, !dbg !41, !tbaa !12
  %12 = load i32, i32* @timerCount, align 4, !dbg !44, !tbaa !12
  %13 = icmp ne i32 %12, 0, !dbg !45
  br i1 %13, label %14, label %Timer_Reset.exit, !dbg !44

14:                                               ; preds = %9
  br label %Timer_Reset.exit, !dbg !46

Timer_Reset.exit:                                 ; preds = %9, %14
  %15 = load i32, i32* @cnt5, align 4, !dbg !47, !tbaa !12
  %16 = add nsw i32 %15, 1, !dbg !47
  store i32 %16, i32* @cnt5, align 4, !dbg !47, !tbaa !12
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define void @Timer_C_isr() #2 !dbg !49 {
  store i32 1, i32* @timerCount, align 4, !dbg !50, !tbaa !12
  %1 = load i32, i32* @timerCount, align 4, !dbg !51, !tbaa !12
  %2 = icmp ne i32 %1, 0, !dbg !52
  br i1 %2, label %3, label %4, !dbg !51

3:                                                ; preds = %0
  br label %4, !dbg !53

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @timerCount, align 4, !dbg !54, !tbaa !12
  %6 = icmp eq i32 %5, 0, !dbg !55
  br i1 %6, label %7, label %9, !dbg !54

7:                                                ; preds = %4
  %8 = load i32, i32* @LED_0, align 4, !dbg !56, !tbaa !12
  store i32 %8, i32* @P1OUT, align 4, !dbg !57, !tbaa !12
  br label %9, !dbg !58

9:                                                ; preds = %7, %4
  %10 = load i32, i32* @cnt3, align 4, !dbg !59, !tbaa !12
  %11 = add nsw i32 %10, 1, !dbg !59
  store i32 %11, i32* @cnt3, align 4, !dbg !59, !tbaa !12
  ret void, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @Timer_Force() #2 !dbg !10 {
  %1 = load i32, i32* @timerCount, align 4, !dbg !61, !tbaa !12
  %2 = add i32 %1, 1, !dbg !61
  store i32 %2, i32* @timerCount, align 4, !dbg !61, !tbaa !12
  %3 = load i32, i32* @cnt4, align 4, !dbg !62, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !62
  store i32 %4, i32* @cnt4, align 4, !dbg !62, !tbaa !12
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @Timer_Reset() #2 !dbg !42 {
  store i32 0, i32* @timerCount, align 4, !dbg !64, !tbaa !12
  %1 = load i32, i32* @timerCount, align 4, !dbg !65, !tbaa !12
  %2 = icmp ne i32 %1, 0, !dbg !66
  br i1 %2, label %3, label %4, !dbg !65

3:                                                ; preds = %0
  br label %4, !dbg !67

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @cnt5, align 4, !dbg !68, !tbaa !12
  %6 = add nsw i32 %5, 1, !dbg !68
  store i32 %6, i32* @cnt5, align 4, !dbg !68, !tbaa !12
  ret void, !dbg !69
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_003_001_main() #2 !dbg !70 {
  %1 = load i32, i32* @WDTPW, align 4, !dbg !71, !tbaa !12
  %2 = load i32, i32* @WDTHOLD, align 4, !dbg !72, !tbaa !12
  %3 = add nsw i32 %1, %2, !dbg !73
  store i32 %3, i32* @WDTCTL, align 4, !dbg !74, !tbaa !12
  %4 = load i32, i32* @LED_0, align 4, !dbg !75, !tbaa !12
  %5 = load i32, i32* @LED_1, align 4, !dbg !76, !tbaa !12
  %6 = add nsw i32 %4, %5, !dbg !77
  store i32 %6, i32* @LED_DIR, align 4, !dbg !78, !tbaa !12
  %7 = load i32, i32* @LED_0, align 4, !dbg !79, !tbaa !12
  %8 = load i32, i32* @LED_1, align 4, !dbg !80, !tbaa !12
  %9 = add nsw i32 %7, %8, !dbg !81
  %10 = add nsw i32 1, %9, !dbg !82
  store i32 %10, i32* @LED_OUT, align 4, !dbg !83, !tbaa !12
  %11 = load i32, i32* @CCIE, align 4, !dbg !84, !tbaa !12
  store i32 %11, i32* @CCTL0, align 4, !dbg !85, !tbaa !12
  %12 = load i32, i32* @TASSEL_2, align 4, !dbg !86, !tbaa !12
  %13 = load i32, i32* @MC_2, align 4, !dbg !87, !tbaa !12
  %14 = add nsw i32 %12, %13, !dbg !88
  store i32 %14, i32* @TACTL, align 4, !dbg !89, !tbaa !12
  store i32 0, i32* @timerCount, align 4, !dbg !90, !tbaa !12
  ret i32 undef, !dbg !91
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink/blink3.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/blink")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "Timer_A_isr", scope: !1, file: !1, line: 31, type: !8, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 92, column: 20, scope: !10, inlinedAt: !11)
!10 = distinct !DISubprogram(name: "Timer_Force", scope: !1, file: !1, line: 87, type: !8, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!11 = distinct !DILocation(line: 34, column: 5, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 93, column: 13, scope: !10, inlinedAt: !11)
!17 = !DILocation(line: 35, column: 16, scope: !7)
!18 = !DILocation(line: 36, column: 9, scope: !7)
!19 = !DILocation(line: 36, column: 20, scope: !7)
!20 = !DILocation(line: 37, column: 5, scope: !7)
!21 = !DILocation(line: 38, column: 8, scope: !7)
!22 = !DILocation(line: 38, column: 19, scope: !7)
!23 = !DILocation(line: 39, column: 18, scope: !7)
!24 = !DILocation(line: 39, column: 26, scope: !7)
!25 = !DILocation(line: 39, column: 24, scope: !7)
!26 = !DILocation(line: 39, column: 15, scope: !7)
!27 = !DILocation(line: 40, column: 5, scope: !7)
!28 = !DILocation(line: 41, column: 13, scope: !7)
!29 = !DILocation(line: 42, column: 1, scope: !7)
!30 = distinct !DISubprogram(name: "Timer_B_isr", scope: !1, file: !1, line: 45, type: !8, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 49, column: 20, scope: !30)
!32 = !DILocation(line: 53, column: 13, scope: !30)
!33 = !DILocation(line: 53, column: 24, scope: !30)
!34 = !DILocation(line: 55, column: 9, scope: !30)
!35 = !DILocation(line: 56, column: 13, scope: !30)
!36 = !DILocation(line: 56, column: 24, scope: !30)
!37 = !DILocation(line: 57, column: 22, scope: !30)
!38 = !DILocation(line: 57, column: 20, scope: !30)
!39 = !DILocation(line: 58, column: 9, scope: !30)
!40 = !DILocation(line: 59, column: 13, scope: !30)
!41 = !DILocation(line: 102, column: 20, scope: !42, inlinedAt: !43)
!42 = distinct !DISubprogram(name: "Timer_Reset", scope: !1, file: !1, line: 99, type: !8, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = distinct !DILocation(line: 61, column: 9, scope: !30)
!44 = !DILocation(line: 106, column: 13, scope: !42, inlinedAt: !43)
!45 = !DILocation(line: 106, column: 24, scope: !42, inlinedAt: !43)
!46 = !DILocation(line: 108, column: 9, scope: !42, inlinedAt: !43)
!47 = !DILocation(line: 109, column: 13, scope: !42, inlinedAt: !43)
!48 = !DILocation(line: 63, column: 1, scope: !30)
!49 = distinct !DISubprogram(name: "Timer_C_isr", scope: !1, file: !1, line: 66, type: !8, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 72, column: 20, scope: !49)
!51 = !DILocation(line: 76, column: 13, scope: !49)
!52 = !DILocation(line: 76, column: 24, scope: !49)
!53 = !DILocation(line: 78, column: 9, scope: !49)
!54 = !DILocation(line: 79, column: 13, scope: !49)
!55 = !DILocation(line: 79, column: 24, scope: !49)
!56 = !DILocation(line: 80, column: 22, scope: !49)
!57 = !DILocation(line: 80, column: 20, scope: !49)
!58 = !DILocation(line: 81, column: 9, scope: !49)
!59 = !DILocation(line: 82, column: 13, scope: !49)
!60 = !DILocation(line: 84, column: 1, scope: !49)
!61 = !DILocation(line: 92, column: 20, scope: !10)
!62 = !DILocation(line: 93, column: 13, scope: !10)
!63 = !DILocation(line: 96, column: 1, scope: !10)
!64 = !DILocation(line: 102, column: 20, scope: !42)
!65 = !DILocation(line: 106, column: 13, scope: !42)
!66 = !DILocation(line: 106, column: 24, scope: !42)
!67 = !DILocation(line: 108, column: 9, scope: !42)
!68 = !DILocation(line: 109, column: 13, scope: !42)
!69 = !DILocation(line: 111, column: 1, scope: !42)
!70 = distinct !DISubprogram(name: "svp_simple_003_001_main", scope: !1, file: !1, line: 113, type: !8, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 115, column: 14, scope: !70)
!72 = !DILocation(line: 115, column: 22, scope: !70)
!73 = !DILocation(line: 115, column: 20, scope: !70)
!74 = !DILocation(line: 115, column: 12, scope: !70)
!75 = !DILocation(line: 117, column: 15, scope: !70)
!76 = !DILocation(line: 117, column: 23, scope: !70)
!77 = !DILocation(line: 117, column: 21, scope: !70)
!78 = !DILocation(line: 117, column: 13, scope: !70)
!79 = !DILocation(line: 119, column: 20, scope: !70)
!80 = !DILocation(line: 119, column: 26, scope: !70)
!81 = !DILocation(line: 119, column: 25, scope: !70)
!82 = !DILocation(line: 119, column: 17, scope: !70)
!83 = !DILocation(line: 119, column: 13, scope: !70)
!84 = !DILocation(line: 121, column: 13, scope: !70)
!85 = !DILocation(line: 121, column: 11, scope: !70)
!86 = !DILocation(line: 122, column: 13, scope: !70)
!87 = !DILocation(line: 122, column: 24, scope: !70)
!88 = !DILocation(line: 122, column: 22, scope: !70)
!89 = !DILocation(line: 122, column: 11, scope: !70)
!90 = !DILocation(line: 124, column: 16, scope: !70)
!91 = !DILocation(line: 138, column: 1, scope: !70)
