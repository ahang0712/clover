; ModuleID = 'svp_simple_702_001-opt.bc'
source_filename = "./svp_simple_702_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 0, align 4
@h = global i32 0, align 4
@i = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @assume_abort_if_not(i32 %0) #0 !dbg !20 {
  %2 = icmp ne i32 %0, 0, !dbg !21
  br i1 %2, label %4, label %3, !dbg !22

3:                                                ; preds = %1
  call void @abort() #5, !dbg !23
  unreachable, !dbg !23

4:                                                ; preds = %1
  ret void, !dbg !24
}

; Function Attrs: nounwind uwtable
define void @svp_simple_702_001_isr_1(i8* %0) #0 !dbg !25 {
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !26
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !27
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !28
  %5 = icmp slt i32 %2, 1000, !dbg !29
  br i1 %5, label %6, label %26, !dbg !30

6:                                                ; preds = %1
  %7 = load i32, i32* @g, align 4, !dbg !31, !tbaa !32
  %8 = load i32, i32* @h, align 4, !dbg !36, !tbaa !32
  %9 = icmp sle i32 %8, %7, !dbg !37
  %10 = zext i1 %9 to i32, !dbg !37
  br i1 %9, label %__VERIFIER_assert.exit, label %11, !dbg !38

11:                                               ; preds = %6
  %12 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !40
  call void @abort() #6, !dbg !42
  unreachable, !dbg !42

__VERIFIER_assert.exit:                           ; preds = %6
  %13 = icmp eq i32 %7, %8, !dbg !43
  %14 = zext i1 %13 to i32, !dbg !43
  br i1 %13, label %__VERIFIER_assert.exit1, label %15, !dbg !44

15:                                               ; preds = %__VERIFIER_assert.exit
  %16 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !46
  call void @abort() #6, !dbg !48
  unreachable, !dbg !48

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %17 = icmp sle i32 %7, 2147483616, !dbg !49
  %18 = zext i1 %17 to i32, !dbg !52
  br i1 %17, label %plus.exit, label %19, !dbg !53

19:                                               ; preds = %__VERIFIER_assert.exit1
  call void @abort() #6, !dbg !55
  unreachable, !dbg !55

plus.exit:                                        ; preds = %__VERIFIER_assert.exit1
  %20 = add nsw i32 %7, 31, !dbg !56
  store i32 %20, i32* @i, align 4, !dbg !57, !tbaa !32
  %21 = load i32, i32* @i, align 4, !dbg !58, !tbaa !32
  %22 = icmp sge i32 %21, %7, !dbg !59
  %23 = zext i1 %22 to i32, !dbg !59
  br i1 %22, label %__VERIFIER_assert.exit2, label %24, !dbg !60

24:                                               ; preds = %plus.exit
  %25 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !62
  call void @abort() #6, !dbg !64
  unreachable, !dbg !64

__VERIFIER_assert.exit2:                          ; preds = %plus.exit
  br label %26, !dbg !65

26:                                               ; preds = %__VERIFIER_assert.exit2, %1
  ret void, !dbg !66
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: nounwind uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !50 {
  %3 = icmp sge i32 %1, 0, !dbg !67
  br i1 %3, label %9, label %4, !dbg !68

4:                                                ; preds = %2
  %5 = sext i32 %0 to i64, !dbg !69
  %6 = sext i32 %1 to i64, !dbg !70
  %7 = sub nsw i64 -2147483648, %6, !dbg !71
  %8 = icmp sge i64 %5, %7, !dbg !72
  br label %9, !dbg !68

9:                                                ; preds = %4, %2
  %10 = phi i1 [ true, %2 ], [ %8, %4 ]
  %11 = zext i1 %10 to i32, !dbg !68
  br i1 %10, label %assume_abort_if_not.exit, label %12, !dbg !73

12:                                               ; preds = %9
  call void @abort() #6, !dbg !75
  unreachable, !dbg !75

assume_abort_if_not.exit:                         ; preds = %9
  %13 = icmp sle i32 %1, 0, !dbg !76
  br i1 %13, label %17, label %14, !dbg !77

14:                                               ; preds = %assume_abort_if_not.exit
  %15 = sub nsw i32 2147483647, %1, !dbg !78
  %16 = icmp sle i32 %0, %15, !dbg !79
  br label %17, !dbg !77

17:                                               ; preds = %14, %assume_abort_if_not.exit
  %18 = phi i1 [ true, %assume_abort_if_not.exit ], [ %16, %14 ]
  %19 = zext i1 %18 to i32, !dbg !77
  br i1 %18, label %assume_abort_if_not.exit1, label %20, !dbg !80

20:                                               ; preds = %17
  call void @abort() #6, !dbg !82
  unreachable, !dbg !82

assume_abort_if_not.exit1:                        ; preds = %17
  %21 = add nsw i32 %0, %1, !dbg !83
  ret i32 %21, !dbg !84
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_702_001_main() #0 !dbg !85 {
  %1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !86
  %2 = icmp sgt i32 %1, -1000, !dbg !87
  br i1 %2, label %3, label %9, !dbg !88

3:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !89, !tbaa !32
  store i32 %1, i32* @g, align 4, !dbg !90, !tbaa !32
  %4 = sext i32 %1 to i64, !dbg !91
  %5 = icmp sge i64 %4, -2147483631, !dbg !93
  %6 = zext i1 %5 to i32, !dbg !94
  br i1 %5, label %plus.exit, label %7, !dbg !95

7:                                                ; preds = %3
  call void @abort() #6, !dbg !97
  unreachable, !dbg !97

plus.exit:                                        ; preds = %3
  %8 = add nsw i32 %1, -17, !dbg !98
  store i32 %8, i32* @h, align 4, !dbg !99, !tbaa !32
  store i32 %1, i32* @h, align 4, !dbg !100, !tbaa !32
  store i32 3, i32* @i, align 4, !dbg !101, !tbaa !32
  br label %9, !dbg !102

9:                                                ; preds = %plus.exit, %0
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind uwtable
define i32 @isr_plus(i32 %0, i32 %1) #0 !dbg !104 {
  %3 = icmp sge i32 %1, 0, !dbg !105
  br i1 %3, label %9, label %4, !dbg !106

4:                                                ; preds = %2
  %5 = sext i32 %0 to i64, !dbg !107
  %6 = sext i32 %1 to i64, !dbg !108
  %7 = sub nsw i64 -2147483648, %6, !dbg !109
  %8 = icmp sge i64 %5, %7, !dbg !110
  br label %9, !dbg !106

9:                                                ; preds = %4, %2
  %10 = phi i1 [ true, %2 ], [ %8, %4 ]
  %11 = zext i1 %10 to i32, !dbg !106
  br i1 %10, label %assume_abort_if_not.exit, label %12, !dbg !111

12:                                               ; preds = %9
  call void @abort() #6, !dbg !113
  unreachable, !dbg !113

assume_abort_if_not.exit:                         ; preds = %9
  %13 = icmp sle i32 %1, 0, !dbg !114
  br i1 %13, label %17, label %14, !dbg !115

14:                                               ; preds = %assume_abort_if_not.exit
  %15 = sub nsw i32 2147483647, %1, !dbg !116
  %16 = icmp sle i32 %0, %15, !dbg !117
  br label %17, !dbg !115

17:                                               ; preds = %14, %assume_abort_if_not.exit
  %18 = phi i1 [ true, %assume_abort_if_not.exit ], [ %16, %14 ]
  %19 = zext i1 %18 to i32, !dbg !115
  br i1 %18, label %assume_abort_if_not.exit1, label %20, !dbg !118

20:                                               ; preds = %17
  call void @abort() #6, !dbg !120
  unreachable, !dbg !120

assume_abort_if_not.exit1:                        ; preds = %17
  %21 = add nsw i32 %0, %1, !dbg !121
  ret i32 %21, !dbg !122
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_702_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_702_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 3, column: 40, scope: !12)
!14 = !DILocation(line: 3, column: 39, scope: !12)
!15 = !DILocation(line: 3, column: 48, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 3, column: 58, scope: !12)
!18 = !DILocation(line: 3, column: 72, scope: !12)
!19 = !DILocation(line: 3, column: 84, scope: !12)
!20 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 5, column: 7, scope: !20)
!22 = !DILocation(line: 5, column: 6, scope: !20)
!23 = !DILocation(line: 5, column: 14, scope: !20)
!24 = !DILocation(line: 6, column: 1, scope: !20)
!25 = distinct !DISubprogram(name: "svp_simple_702_001_isr_1", scope: !8, file: !8, line: 20, type: !9, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = !DILocation(line: 21, column: 11, scope: !25)
!27 = !DILocation(line: 22, column: 11, scope: !25)
!28 = !DILocation(line: 23, column: 11, scope: !25)
!29 = !DILocation(line: 24, column: 9, scope: !25)
!30 = !DILocation(line: 24, column: 7, scope: !25)
!31 = !DILocation(line: 25, column: 9, scope: !25)
!32 = !{!33, !33, i64 0}
!33 = !{!"int", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C/C++ TBAA"}
!36 = !DILocation(line: 26, column: 9, scope: !25)
!37 = !DILocation(line: 27, column: 25, scope: !25)
!38 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !39)
!39 = distinct !DILocation(line: 27, column: 5, scope: !25)
!40 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !41)
!41 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !39)
!42 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !39)
!43 = !DILocation(line: 29, column: 25, scope: !25)
!44 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !45)
!45 = distinct !DILocation(line: 29, column: 5, scope: !25)
!46 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !47)
!47 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !45)
!48 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !45)
!49 = !DILocation(line: 57, column: 35, scope: !50, inlinedAt: !51)
!50 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = distinct !DILocation(line: 31, column: 9, scope: !25)
!52 = !DILocation(line: 57, column: 30, scope: !50, inlinedAt: !51)
!53 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !54)
!54 = distinct !DILocation(line: 57, column: 3, scope: !50, inlinedAt: !51)
!55 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !54)
!56 = !DILocation(line: 58, column: 12, scope: !50, inlinedAt: !51)
!57 = !DILocation(line: 31, column: 7, scope: !25)
!58 = !DILocation(line: 32, column: 9, scope: !25)
!59 = !DILocation(line: 33, column: 25, scope: !25)
!60 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !61)
!61 = distinct !DILocation(line: 33, column: 5, scope: !25)
!62 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !63)
!63 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !61)
!64 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !61)
!65 = !DILocation(line: 35, column: 3, scope: !25)
!66 = !DILocation(line: 37, column: 1, scope: !25)
!67 = !DILocation(line: 56, column: 25, scope: !50)
!68 = !DILocation(line: 56, column: 30, scope: !50)
!69 = !DILocation(line: 56, column: 33, scope: !50)
!70 = !DILocation(line: 56, column: 52, scope: !50)
!71 = !DILocation(line: 56, column: 50, scope: !50)
!72 = !DILocation(line: 56, column: 35, scope: !50)
!73 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !74)
!74 = distinct !DILocation(line: 56, column: 3, scope: !50)
!75 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !74)
!76 = !DILocation(line: 57, column: 25, scope: !50)
!77 = !DILocation(line: 57, column: 30, scope: !50)
!78 = !DILocation(line: 57, column: 49, scope: !50)
!79 = !DILocation(line: 57, column: 35, scope: !50)
!80 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !81)
!81 = distinct !DILocation(line: 57, column: 3, scope: !50)
!82 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !81)
!83 = !DILocation(line: 58, column: 12, scope: !50)
!84 = !DILocation(line: 58, column: 3, scope: !50)
!85 = distinct !DISubprogram(name: "svp_simple_702_001_main", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 40, column: 11, scope: !85)
!87 = !DILocation(line: 41, column: 9, scope: !85)
!88 = !DILocation(line: 41, column: 7, scope: !85)
!89 = !DILocation(line: 43, column: 7, scope: !85)
!90 = !DILocation(line: 44, column: 7, scope: !85)
!91 = !DILocation(line: 56, column: 33, scope: !50, inlinedAt: !92)
!92 = distinct !DILocation(line: 45, column: 9, scope: !85)
!93 = !DILocation(line: 56, column: 35, scope: !50, inlinedAt: !92)
!94 = !DILocation(line: 56, column: 30, scope: !50, inlinedAt: !92)
!95 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !96)
!96 = distinct !DILocation(line: 56, column: 3, scope: !50, inlinedAt: !92)
!97 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !96)
!98 = !DILocation(line: 58, column: 12, scope: !50, inlinedAt: !92)
!99 = !DILocation(line: 45, column: 7, scope: !85)
!100 = !DILocation(line: 47, column: 7, scope: !85)
!101 = !DILocation(line: 49, column: 7, scope: !85)
!102 = !DILocation(line: 51, column: 3, scope: !85)
!103 = !DILocation(line: 52, column: 3, scope: !85)
!104 = distinct !DISubprogram(name: "isr_plus", scope: !8, file: !8, line: 60, type: !9, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 61, column: 25, scope: !104)
!106 = !DILocation(line: 61, column: 30, scope: !104)
!107 = !DILocation(line: 61, column: 33, scope: !104)
!108 = !DILocation(line: 61, column: 52, scope: !104)
!109 = !DILocation(line: 61, column: 50, scope: !104)
!110 = !DILocation(line: 61, column: 35, scope: !104)
!111 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !112)
!112 = distinct !DILocation(line: 61, column: 3, scope: !104)
!113 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !112)
!114 = !DILocation(line: 62, column: 25, scope: !104)
!115 = !DILocation(line: 62, column: 30, scope: !104)
!116 = !DILocation(line: 62, column: 49, scope: !104)
!117 = !DILocation(line: 62, column: 35, scope: !104)
!118 = !DILocation(line: 5, column: 6, scope: !20, inlinedAt: !119)
!119 = distinct !DILocation(line: 62, column: 3, scope: !104)
!120 = !DILocation(line: 5, column: 14, scope: !20, inlinedAt: !119)
!121 = !DILocation(line: 63, column: 12, scope: !104)
!122 = !DILocation(line: 63, column: 3, scope: !104)
